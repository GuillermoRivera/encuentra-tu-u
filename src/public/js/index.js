$(document).ready(function() {
  $('select').material_select();
})

let dataAutocomplete = [];
let flag = false;

$('#search-type').change((event) => {
  let resource;
  let url= 'http://localhost:3000/';
  if (event.target.value === 'institution') {
    resource = 'institutions';
  } else if (event.target.value === 'program') {
    resource = 'programs';
  }
  $.ajax({
    method: 'GET',
    url: `http://localhost:3000/${resource}`,
  }).then((data) => {
    dataAutocomplete.push(JSON.parse(data).map((element) => element.name));
    $(function () {
      console.log(dataAutocomplete);
      $('input.autocomplete').autocomplete({
        data: dataAutocomplete[0],
        limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
        onAutocomplete: function(val) {
          console.log('Hello world');
        },
        minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
      });
    });
  });
});