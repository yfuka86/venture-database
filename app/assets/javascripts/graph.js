$(function(){
  $.ajax({
    url: "http://localhost:3000/data"
  }).done(function(res) {
    var COMPANY_OFFSET = 100000;

    var ary = [];
    res.people.forEach(function(person){
      ary.push({id: person.id, group: 'person', label: person.name})
    })
    res.organizations.forEach(function(organization){
      ary.push({id: organization.id + COMPANY_OFFSET, group: 'organization', label: organization.name})
    })

    // create an array with nodes
    var nodes = new vis.DataSet(ary);

    ary = [];
    res.acquisitions.forEach(function(acquisition){
      ary.push({
        from: acquisition.parent_id + COMPANY_OFFSET,
        to: acquisition.child_id + COMPANY_OFFSET,
        color: 'red',
        label: 'acquired by $' + acquisition.amount,
        arrows: 'to'
      })
    })
    res.joins.forEach(function(join){
      ary.push({
        from: join.person_id,
        to: join.company_id + COMPANY_OFFSET,
        color: 'blue',
        label: 'joined',
        arrows: 'to'
      })
    })
    res.investments.forEach(function(investment){
      ary.push({
        from: investment.investor_type === 'Organization' ? investment.investor_id + COMPANY_OFFSET : investment.investor_id,
        to: investment.investee_id + COMPANY_OFFSET,
        color: 'green',
        label: 'invested $' + investment.amount,
        arrows: 'to'
      })
    })

    // create an array with edges
    var edges = new vis.DataSet(ary);

    // create a network
    var container = document.getElementById('graph');

    // provide the data in the vis format
    var data = {
      nodes: nodes,
      edges: edges
    };
    var options = {};

    // initialize your network!
    var network = new vis.Network(container, data, options);
  });

});