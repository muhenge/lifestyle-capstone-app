//= require materialize
//= require jquery2
//= require jquery
//= require materialize-sprockets

  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems, options);
  });

  $('.dropdown-trigger').dropdown();