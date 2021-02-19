@val external document: {..} = "document"

let plusButton = document["getElementById"]("plus-one")
let minusButton = document["getElementById"]("minus-one")

let count = ref(0)

let renderCountView = n => {
  let el = document["getElementById"]("count")
  el["innerText"] = j`Count is $n`
  if n > 0 {
    el["className"] = "count count-positive"
  } else if n < 0 {
    el["className"] = "count count-negative"
  } else {
    el["className"] = "count count-zero"
  }
}

let updateCount = steps => {
  count := count.contents + steps
}

let renderView = steps => {
  updateCount(steps)
  renderCountView(count.contents)
}

let plusOne = () => renderView(1)
let minusOne = () => renderView(-1)

plusButton["addEventListener"]("click", plusOne)
minusButton["addEventListener"]("click", minusOne)
