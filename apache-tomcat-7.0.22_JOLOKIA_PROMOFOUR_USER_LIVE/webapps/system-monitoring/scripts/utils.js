var j4p = new Jolokia({url: "/system-monitoring/service"});

function fetchInfo(d,u,a){
    var req = {
        "type":"READ",
        "mbean":d,
        "attribute":a,
        "target": {
            "url":u,
            "password":"",
            "user":""
        }
    };
    var r = j4p.request(req,{method: "post"});
    return r.value;
}

function displayQueueInformation(d,u){
    var r = fetchInfo(d,u,"MessageCount");
    var r1 = fetchInfo(d,u,"MessagesAdded");
    var r2 = fetchInfo(d,u,"DeliveringCount");
    var r3 = fetchInfo(d,u,"ConsumerCount");
    var queueName = d.replace(/org.hornetq:address=(.+?),.+/g,'$1');
    queueName = queueName.replace(/\"/g,'').replace(/jms.queue./g,'');
    //console.warn(queueName+" @size=["+r+"]");

    var newRow = $("#row-template").clone();
    newRow.appendTo( $("#tdata") );
    newRow.attr("id",queueName);
    $('#'+queueName+" .Queue").html(queueName);
    $('#'+queueName+" .MessageCount").html(r);
    $('#'+queueName+" .MessagesAdded").html(r1);
    $('#'+queueName+" .DeliveringCount").html(r2);
    $('#'+queueName+" .ConsumerCount").html(r3);
    newRow.show();
}

function displayQueuesInformation(u,username,password){
    var req = {
        "type":"SEARCH",
        "mbean":"org.hornetq:*,type=Queue,module=Core",
        "target": {
            "url":u,
            "password":username,
            "user":password
        }
    };
    var r = j4p.request(req,{method: "post"});
    for(var index in r.value){
        displayQueueInformation( r.value[index],u );
    }
}