$(document).ready(() => {
  $('select').material_select();
});

$('#search-button').click((event) => {
  if ($('input.select-dropdown').val() === 'Tipo de búsqueda') {
    alert('Por favor seleccione el tipo de búsqueda');
  }

  if ($('#search-input').val() === '' && $('input.select-dropdown').val() !== 'Tipo de búsqueda') {
    alert('Por favor ingrese un nombre para iniciar la búsqueda');
  }
});

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

    $('#search-input').autocomplete({
      data: fields,
      limit: 20,
      minLength: 1,
    });
  });
});

// $('#filter-inst-type').change((event) => {
//   if (event.target.value === 1) {

//   }
// });
