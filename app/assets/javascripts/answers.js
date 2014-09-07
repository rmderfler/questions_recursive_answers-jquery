$(function () {
  $('.answer').submitOnCheck();
});

jQuery.fn.submitOnCheck = function () {
  this.find('input[type=btn]').click(function () {
    $(this).parent('form').submit();
  });
  return this;
};
