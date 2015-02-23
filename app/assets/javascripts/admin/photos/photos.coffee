evil.block '@@photoUploader',
  _editData: {},
  _thumbTemplate: null,

  removePhotoRequest: (url)->
    $.ajax
      url: url
      type: 'DELETE'
      dataType: 'json'

  init: ->
    $thumbPhotoTemplate = $("#thumb-photo-template")
    if $thumbPhotoTemplate.length > 0
      @_thumbTemplate = Handlebars.compile($thumbPhotoTemplate.html())
    if parseInt(@block.attr('data-photo-max')) > 0 && $(@photo).length > 0
      @uploader.hide()

    @fileupload.fileupload({
      dataType: 'json',
      dropZone: @dropZone,
      done: (e, data) =>
        result = data.result
        @block.removeClass('is-submitting')

        if result.status is 'created'
          @photos.append(@_thumbTemplate(result))
          if parseInt(@block.attr('data-photo-max')) > 0
            @uploader.hide()
        else
          console.log 'Error found'
    }).bind 'fileuploadsubmit', (e, data) =>
      @block.addClass('is-submitting')

    @editPhotoModal.modal({backdrop: 'static', show: false}).on 'hide.bs.modal', (e)=>
      @photoEditor.html('')

  'click on @editPhoto': (e) ->
    e.preventDefault()
    $photoEditSource = $(e.el).parents('@photo').find('@photoEditSource')

    @_editData = {}
    @_editData['dimensions'] = $photoEditSource.data('origin-dimensions')
    @_editData['image'] = $photoEditSource.data('origin')
    @_editData['update_url'] = $photoEditSource.data('update-url')

    image = $('<img />', src: @_editData['image'], id: 'photo-editor')
    @photoEditor.append(image)
    @editPhotoModal.modal('show')

    setTimeout =>
      j = image.Jcrop {
        onSelect: (coords)=>
          @_editData['x'] = coords.x
          @_editData['y'] = coords.y
          @_editData['width'] = coords.w
          @_editData['height'] = coords.h
        ,allowSelect: true
        ,allowMove: true
        ,allowResize: true
#        ,aspectRatio: 1
        ,bgOpacity: 0.5
        ,bgColor: 'black'
        ,addClass: 'jcrop-light'
      }, ->
        photo = $('@photo')
        cropX = parseInt(photo.attr('data-crop-x'))
        cropY = parseInt(photo.attr('data-crop-y'))
        cropWidth = parseInt(photo.attr('data-crop-width'))
        cropHeight = parseInt(photo.attr('data-crop-height'))

        if cropWidth != 0 && cropHeight != 0
          @.setSelect [cropX, cropY, cropX + cropWidth, cropY + cropHeight]

    , 1

  'click on @photoUpdate': (e)->
    $holder = $('.jcrop-holder')
    @_editData['ratio'] = @_editData['dimensions']['width'] / $holder.width()
    $.ajax
      url: @_editData['update_url']
      type: 'PUT',
      data: @_editData,
      success: (data)=>
        if data.status == 'updated'
          $('@photo').filter("[data-id='#{data.id}']").replaceWith(@_thumbTemplate(data))
          @editPhotoModal.modal('hide')

  'click on @removePhoto': (e)->
    e.preventDefault()
    url = e.el.attr('href')

    @removePhotoRequest(url).done (response) =>
      self = this
      e.el.closest("@photo").hide 'fast', ->
        $(this).remove()
        self.uploader.show()
