$ ->
  $('.alert-box a.close-button').click (event)->
    $(this).closest('.alert-box-content').animate { opacity: 0 }, 250, =>
      $(this).closest('.alert-box').slideUp 250

    event.preventDefault()

  $('.alert-box').each ->
    $(this).slideDown 250, =>
      $(this).find('.alert-box-content').animate { opacity: 1 }, 250


    timeout = $(this).data 'timeout'

    unless timeout is undefined
      console?.log timeout
      console?.log 'Hiding alert box'
      timeout = parseInt(timeout)
      setTimeout (=>
        $(this).find('.alert-box-content').animate {opacity: 0}, 250, =>
          $(this).slideUp 250
      ), timeout