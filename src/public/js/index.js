$(document).ready(() => {
  $('select').material_select();
});

// const dataAutocomplete = [];

$('#search-type').change((event) => {
  let resource;
  if (event.target.value === 'institution') {
    resource = 'institutions';
  } else if (event.target.value === 'program') {
    resource = 'programs';
  } else {
    return;
  }
  $.ajax({
    method: 'GET',
    url: `http://localhost:3000/${resource}`,
  }).then((data) => {
    console.log(data);
    $(() => {
      // console.log(dataAutocomplete);
    });
  });
});
