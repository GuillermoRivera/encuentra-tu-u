$(document).ready(() => {
  $('select').material_select();
});

// const dataAutocomplete = [];

$('#search-type').change((event) => {
  console.log(event.target.value);
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
    const fields = {};
    if (resource === 'institutions') {
      data.map((field) => {
        fields[field.nombre_inst] = field.logo;
      });
    } else if (resource === 'programs') {
      data.map((field) => {
        fields[field.nombre_prog] = null;
      });
    }
    console.log(fields);
    $('#search-input').autocomplete({
      data: fields,
      minLength: 1,
    });
  });
});
