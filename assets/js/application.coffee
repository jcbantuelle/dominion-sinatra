Handlebars.registerHelper('times', (n, block) ->
  if n > 0
    accum = for i in [1..n]
      block.fn(i)
    _.reduce(accum, ((memo, elem)-> memo + elem), '')
)

jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
