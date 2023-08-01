var 
    $modalContainer = $('#modal');

$("#btn-modal").on('click', function () {

  
  $modalContainer
      .removeAttr('class')
      .addClass('modalon');

  
});

$modalContainer.on('click', function () {
  $(this).addClass('out');
 
});