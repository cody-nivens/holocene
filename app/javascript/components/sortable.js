// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("jquery-ui-dist/jquery-ui");

$(document).ready(function() {
  $('.chapter_outer-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",

    update: function(_, ui){
      let item      = ui.item
      let itemData  = item.data()
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index() }

      $.ajax({
        type     : 'POST',
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    },
  })

  $('.book-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.book-sortable',

    update: function(_, ui){
      if (ui.sender) return

      let item      = ui.item
      let itemData  = item.data()
      let listID    = item.parents('.ui-sortable-handle').eq(0).data().id
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index(), user_id: listID }

      $.ajax({
        type     : 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    }
  })

  $('.character_category-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.character_category-sortable',

    update: function(_, ui){
      if (ui.sender) return

      let item      = ui.item
      let itemData  = item.data()
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index()}

      $.ajax({
        type     : 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    }
  })

  $('.story-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.story-sortable',

    update: function(_, ui){
      if (ui.sender) return

      let item      = ui.item
      let itemData  = item.data()
      let listID    = item.parents('.ui-sortable-handle').eq(0).data().id
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index(), book_id: listID }

      $.ajax({
        type     : 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    }
  })

  $('.key_point-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.key_point-sortable',

    update: function(_, ui){
      if (ui.sender) return

      let item      = ui.item
      let itemData  = item.data()
      let listID    = item.parents('.ui-sortable-handle').eq(0).data().id
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index(), scripted_id: listID }

      $.ajax({
        type     : 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    }
  })

  $('.scene-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.scene-sortable',

    update: function(_, ui){
      if (ui.sender) return

      let item      = ui.item
      let itemData  = item.data()
      let listID    = item.parents('.ui-sortable-handle').eq(0).data().id
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index(), key_point_id: listID }

      $.ajax({
        type     : 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    }
  })

  $('.character_attribute-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.character_attribute-sortable',

    update: function(_, ui){
      if (ui.sender) return

      let item      = ui.item
      let itemData  = item.data()
      let listID    = item.parents('.ui-sortable-handle').eq(0).data().id
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index(), character_category_id: listID }

      $.ajax({
        type     : 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    }
  })

  $('.chapter-sortable').sortable({
    axis        : "y",
    cursor      : "grabbing",
    placeholder : "ui-state-highlight",
    connectWith : '.chapter-sortable',

    update: function(_, ui){
      if (ui.sender) return

      let item      = ui.item
      let itemData  = item.data()
      let listID    = item.parents('.ui-sortable-handle').eq(0).data().id
      let params    = { _method: 'put' }

      params[itemData.modelName] = { position_position: item.index(), scripted_type: 'Book', scripted_id: listID }

      $.ajax({
        type     : 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url      : itemData.updateUrl,
        dataType : 'json',
        data     : params
      })
    }
  })
})
