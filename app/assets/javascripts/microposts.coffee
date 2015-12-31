$(document).on 'ajax:success', 'a.vote', (status,data,xhr)->
  # update counter
  $(".votes-count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.vote[data-id=#{data.id}]").each ->
    $a = $(this)
    href = $a.attr 'href'
    text = $a.text()
    $a.text($a.data('toggle-text')).attr 'href', $a.data('toggle-href')
    $a.data('toggle-text', text).data 'toggle-href', href
    return

  return