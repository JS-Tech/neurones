$(document).ready(function() {

  var editLink = $('.table .edit'),
  		deleteLink = $('.table .delete'),
  		addLink = $('.table .add');
  addLink.attr('href', window.location.pathname + '/nouveau' );

  // init server tables
  
  $('.tables').dataTable( {
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('.tables').data('source'),
    sScrollX: "100%",   
    
    oLanguage: {
      sUrl: "/datatables/datatables.fr.txt"
    }
  });

  // make a row clickable && handel the buttons

	$('.tables tbody, .client_tables tbody').on("click", "tr", function(e) {
    var id = $('td:first', this).text() ;
  	if ( $(this).hasClass('row_selected') ) {
      $(this).removeClass('row_selected');
      editLink.attr('href', '#').css('background', '#aaa');
      deleteLink.attr('href', '#').removeAttr('data-method').removeAttr('rel').css('background', '#aaa');
    }
    else {
      $('tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      editLink.attr('href', window.location.pathname + '/' + id + '/edition').css('background', '#7f72f5');
      deleteLink.attr('href', window.location.pathname + '/' + id).attr('data-method', 'delete').attr('rel', 'nofollow').css('background', '#7f72f5');
    }
	});

  // specific for users table

  var new_relation = $('.table').find('.new_relation'),
      new_ownership = $('.table').find('.new_ownership');

  $('.user_table tbody').on("click", "tr", function(e) {
    var id = $('td:first', this).text() ;
    if ( $(this).hasClass('row_selected') ) {
      $(this).removeClass('row_selected');
      new_relation.attr('href', '#').css('background', '#aaa');
      new_ownership.attr('href', '#').css('background', '#aaa');
    }
    else {
      $('tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      new_relation.attr('href', '/admin/parents/nouveau?user_id=' + id).css('background', '#7f72f5');
      new_ownership.attr('href', '/admin/ownerships/nouveau?user_id=' + id).css('background', '#7f72f5');
    }
  });

  // ownerships tables

  $('.user_table').dataTable( {
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('.user_table').data('source'),
    sScrollX: "100%",
    oLanguage: {
      sUrl: "/datatables/datatables.fr.txt"
    }
  });

  $('.parent_table').dataTable( {
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('.parent_table').data('source'),
    sScrollX: "100%",
    oLanguage: {
      sUrl: "/datatables/datatables.fr.txt"
    }
  });

  // init client tables

  $('.client_tables').dataTable({
    bJQueryUI: true,
    sPaginationType: "full_numbers",

    oLanguage: {
      sUrl: "/datatables/datatables.fr.txt"
    }
  });
});