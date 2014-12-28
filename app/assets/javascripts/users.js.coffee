$ ->
  $('.actw-filters .filter-products').each ->
    filter = $(@)
    id = filter.data('filter-id')
    $.ajax "/api/v1/filters/#{id}",
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        filter.html("Request ERROR")
      success: (data, textStatus, jqXHR) ->
        filter.html("SUCCESS")
