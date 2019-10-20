var approvalStatus = $.usertasks.usertask2.last.desicision;
var bidId = $.context.BidInfo.d.BidId;
var data = {"BidId":bidId, "Status":approvalStatus};

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;
// Call email Status change
xhr.open("POST", "/eBidSystem//workflow/SetBidStatus.xsjs");
xhr.setRequestHeader("Content-Type", "application/json");
xhr.setRequestHeader("Accept", "application/json");
xhr.send(JSON.stringify(data));
