$(function () {
  $('.add_answer').submitOnCheck();
});

jQuery.fn.submitOnCheck = function () {
  this.find('input[type=submit]').remove();
  this.find('input[type=btn]').click(function () {
    $(this).parent('form').submit();
  });
  return this;
};
