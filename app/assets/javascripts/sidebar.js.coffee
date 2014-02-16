jQuery ->
  $(document).ready ->
    bottom_position = $('#footer').offset().top - parseFloat($('#footer').css('marginTop').replace(/auto/, 0))

    $(window).scroll ->
      sidebar_top = $('#sidebar-wrapper').offset().top - parseFloat($('#sidebar-inner-wrapper').css('marginTop').replace(/auto/, 0))
      window_top = $(this).scrollTop()
      pozice = bottom_position-720

      if sidebar_top > window_top && window_top+500 < bottom_position
        $('#sidebar-inner-wrapper').removeClass('fixed')
        $('#sidebar-inner-wrapper').css({top:"10px"})

      if window_top >= sidebar_top && window_top+500 <= bottom_position
        $('#sidebar-inner-wrapper').addClass('fixed')
        $('#sidebar-inner-wrapper').css({top:"10px"})

      # if window_top >= sidebar_top && window_top+650 >= bottom_position
      #   $('#sidebar-inner-wrapper').removeClass('fixed')
      #   $('#sidebar-inner-wrapper').css({top:pozice})
