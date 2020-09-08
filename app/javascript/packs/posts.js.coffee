# Run this example by adding <%= javascript_pack_tag 'hello_coffee' %> to the head of your layout file,
# like app/views/layouts/application.html.erb.

$ ->
  if $('.pagination').length && $('#infinite-scrolling').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').text("Loading more posts...")
        $.getScript(url)
      return
    return