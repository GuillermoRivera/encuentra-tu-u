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
    });
  });
});