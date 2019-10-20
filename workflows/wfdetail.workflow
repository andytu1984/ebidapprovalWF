{
	"contents": {
		"8bd4e07d-d7e8-4ebc-93d8-78a0111f7985": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "wfdetail",
			"subject": "wfdetail",
			"name": "wfdetail",
			"lastIds": "3174fee3-1a28-420f-9845-502259908651",
			"events": {
				"5bdf50bb-0d0f-4d49-af43-287030c5c97d": {
					"name": "StartEvent1"
				},
				"580b80e6-1f51-4d58-8cb1-16e167b46eb1": {
					"name": "EndEvent3"
				}
			},
			"activities": {
				"1c81223d-c664-48f5-a38c-90901972989b": {
					"name": "ManagerApproval"
				},
				"6dad8165-6b93-4a84-9904-06505739cdff": {
					"name": "Get Bid Info"
				},
				"83a7c501-57b7-4b66-b917-368177b4a40a": {
					"name": "SetBidStatus_WF"
				},
				"422c1d00-7ff5-4866-98a8-64f733cfe3cb": {
					"name": "EmailSending"
				},
				"86377b1a-3e07-4acd-b6b6-3e2888159a40": {
					"name": "StatusCheck"
				}
			},
			"sequenceFlows": {
				"b2e4dcda-4d53-4a4a-a3f8-28f35bd77675": {
					"name": "SequenceFlow1"
				},
				"6561ee86-c8e5-4cba-8727-a273d6167a4c": {
					"name": "SequenceFlow4"
				},
				"bf5ed306-ce93-4ea9-b2f8-fb5dec0f1f90": {
					"name": "SequenceFlow11"
				},
				"31c563c3-b79d-46c6-913d-76b748639ed2": {
					"name": "SequenceFlow12"
				},
				"b9ead1e4-92d1-40fd-a6ff-964fa059b4e4": {
					"name": "SequenceFlow13"
				},
				"4402268b-1129-4df6-bc08-4fd2819c86a5": {
					"name": "Approved"
				},
				"7df5e9a3-e03c-49d7-abee-cd7ffa01ee7e": {
					"name": "Rejected"
				}
			},
			"diagrams": {
				"c74448d5-aa88-44e2-b26d-7c387ea8b263": {}
			}
		},
		"5bdf50bb-0d0f-4d49-af43-287030c5c97d": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"71efab71-a948-49d1-a5f3-f598ff028877": {}
			}
		},
		"580b80e6-1f51-4d58-8cb1-16e167b46eb1": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent3",
			"name": "EndEvent3"
		},
		"1c81223d-c664-48f5-a38c-90901972989b": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Bidding initiation approval",
			"description": "Dear Manager,\nHere is for Bidding initiation approval, please check detail as below.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/bpmformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.BidInfo.d.BidManager}",
			"formReference": "/forms/wfdetail/ManagerApproval.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "managerapproval"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask2",
			"name": "ManagerApproval"
		},
		"6dad8165-6b93-4a84-9904-06505739cdff": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "eBidSystem",
			"path": "/xsodata/Bidding.xsodata/Bid('${context.BidId}')",
			"httpMethod": "GET",
			"responseVariable": "${context.BidInfo}",
			"id": "servicetask2",
			"name": "Get Bid Info"
		},
		"83a7c501-57b7-4b66-b917-368177b4a40a": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/wfdetail/SetBidStatus.js",
			"id": "scripttask1",
			"name": "SetBidStatus_WF"
		},
		"b2e4dcda-4d53-4a4a-a3f8-28f35bd77675": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "5bdf50bb-0d0f-4d49-af43-287030c5c97d",
			"targetRef": "6dad8165-6b93-4a84-9904-06505739cdff"
		},
		"6561ee86-c8e5-4cba-8727-a273d6167a4c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "6dad8165-6b93-4a84-9904-06505739cdff",
			"targetRef": "1c81223d-c664-48f5-a38c-90901972989b"
		},
		"bf5ed306-ce93-4ea9-b2f8-fb5dec0f1f90": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "1c81223d-c664-48f5-a38c-90901972989b",
			"targetRef": "83a7c501-57b7-4b66-b917-368177b4a40a"
		},
		"31c563c3-b79d-46c6-913d-76b748639ed2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "83a7c501-57b7-4b66-b917-368177b4a40a",
			"targetRef": "86377b1a-3e07-4acd-b6b6-3e2888159a40"
		},
		"c74448d5-aa88-44e2-b26d-7c387ea8b263": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"8864c5a6-721c-472b-8897-6fbaf1e30bf0": {},
				"14214bef-fa74-4c9a-9d3b-34666573f30e": {},
				"d37f1f42-b86f-4889-8b38-9835f232b967": {},
				"c033aa2c-d558-4513-bcd6-97e8ded42ec5": {},
				"8800ae9a-5bca-4d90-a7ea-f1215f07be86": {},
				"2dd958bf-1e7c-4211-bc40-e364966737b9": {},
				"bddfe10c-5e81-4866-a971-81d2ad131373": {},
				"cd9a51ce-9def-47c5-9a76-c22ac67f1beb": {},
				"56a0d1f5-83e0-457b-94b3-a3a74b32fbff": {},
				"973ed069-74da-46a1-b96d-1b96c9835b53": {},
				"85b9d421-dbab-4de0-bcd3-7c75880074d4": {},
				"ceff7630-9a1a-4143-a3d7-d7afbe5df143": {},
				"9c9282ce-a32d-46af-a838-c2a4bd7ea9e3": {},
				"2313a560-0316-45b1-8f16-2eb39d073bfa": {}
			}
		},
		"71efab71-a948-49d1-a5f3-f598ff028877": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/wfdetail/sampleData.json",
			"id": "default-start-context"
		},
		"8864c5a6-721c-472b-8897-6fbaf1e30bf0": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 63.999999701976776,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "5bdf50bb-0d0f-4d49-af43-287030c5c97d"
		},
		"14214bef-fa74-4c9a-9d3b-34666573f30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,44 79.99999970197678,94",
			"sourceSymbol": "8864c5a6-721c-472b-8897-6fbaf1e30bf0",
			"targetSymbol": "c033aa2c-d558-4513-bcd6-97e8ded42ec5",
			"object": "b2e4dcda-4d53-4a4a-a3f8-28f35bd77675"
		},
		"d37f1f42-b86f-4889-8b38-9835f232b967": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 29.999999701976776,
			"y": 204,
			"width": 100,
			"height": 60,
			"object": "1c81223d-c664-48f5-a38c-90901972989b"
		},
		"c033aa2c-d558-4513-bcd6-97e8ded42ec5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 29.999999701976776,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "6dad8165-6b93-4a84-9904-06505739cdff"
		},
		"8800ae9a-5bca-4d90-a7ea-f1215f07be86": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,154 79.99999970197678,204",
			"sourceSymbol": "c033aa2c-d558-4513-bcd6-97e8ded42ec5",
			"targetSymbol": "d37f1f42-b86f-4889-8b38-9835f232b967",
			"object": "6561ee86-c8e5-4cba-8727-a273d6167a4c"
		},
		"2dd958bf-1e7c-4211-bc40-e364966737b9": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 62.499999701976776,
			"y": 665.9999976158142,
			"width": 35,
			"height": 35,
			"object": "580b80e6-1f51-4d58-8cb1-16e167b46eb1"
		},
		"bddfe10c-5e81-4866-a971-81d2ad131373": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,264 79.99999970197678,314",
			"sourceSymbol": "d37f1f42-b86f-4889-8b38-9835f232b967",
			"targetSymbol": "cd9a51ce-9def-47c5-9a76-c22ac67f1beb",
			"object": "bf5ed306-ce93-4ea9-b2f8-fb5dec0f1f90"
		},
		"cd9a51ce-9def-47c5-9a76-c22ac67f1beb": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 29.999999701976776,
			"y": 314,
			"width": 100,
			"height": 60,
			"object": "83a7c501-57b7-4b66-b917-368177b4a40a"
		},
		"56a0d1f5-83e0-457b-94b3-a3a74b32fbff": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,374 79.99999970197678,424",
			"sourceSymbol": "cd9a51ce-9def-47c5-9a76-c22ac67f1beb",
			"targetSymbol": "ceff7630-9a1a-4143-a3d7-d7afbe5df143",
			"object": "31c563c3-b79d-46c6-913d-76b748639ed2"
		},
		"3174fee3-1a28-420f-9845-502259908651": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"messageeventdefinition": 1,
			"timereventdefinition": 1,
			"sequenceflow": 16,
			"startevent": 1,
			"intermediatemessageevent": 1,
			"endevent": 3,
			"usertask": 2,
			"servicetask": 2,
			"scripttask": 2,
			"exclusivegateway": 5,
			"parallelgateway": 1
		},
		"422c1d00-7ff5-4866-98a8-64f733cfe3cb": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/wfdetail/EmailService.js",
			"id": "scripttask2",
			"name": "EmailSending"
		},
		"973ed069-74da-46a1-b96d-1b96c9835b53": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 166.99999940395355,
			"y": 532.9999988079071,
			"width": 100,
			"height": 60,
			"object": "422c1d00-7ff5-4866-98a8-64f733cfe3cb"
		},
		"b9ead1e4-92d1-40fd-a6ff-964fa059b4e4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "422c1d00-7ff5-4866-98a8-64f733cfe3cb",
			"targetRef": "580b80e6-1f51-4d58-8cb1-16e167b46eb1"
		},
		"85b9d421-dbab-4de0-bcd3-7c75880074d4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "216.99999940395355,592.9999988079071 217,629.75 80,629.75 79.99999970197678,665.9999976158142",
			"sourceSymbol": "973ed069-74da-46a1-b96d-1b96c9835b53",
			"targetSymbol": "2dd958bf-1e7c-4211-bc40-e364966737b9",
			"object": "b9ead1e4-92d1-40fd-a6ff-964fa059b4e4"
		},
		"86377b1a-3e07-4acd-b6b6-3e2888159a40": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway5",
			"name": "StatusCheck",
			"default": "4402268b-1129-4df6-bc08-4fd2819c86a5"
		},
		"ceff7630-9a1a-4143-a3d7-d7afbe5df143": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 58.999999701976776,
			"y": 424,
			"object": "86377b1a-3e07-4acd-b6b6-3e2888159a40"
		},
		"4402268b-1129-4df6-bc08-4fd2819c86a5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "Approved",
			"sourceRef": "86377b1a-3e07-4acd-b6b6-3e2888159a40",
			"targetRef": "422c1d00-7ff5-4866-98a8-64f733cfe3cb"
		},
		"9c9282ce-a32d-46af-a838-c2a4bd7ea9e3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,466 80,499.5 217,499.5 216.99999940395355,532.9999988079071",
			"sourceSymbol": "ceff7630-9a1a-4143-a3d7-d7afbe5df143",
			"targetSymbol": "973ed069-74da-46a1-b96d-1b96c9835b53",
			"object": "4402268b-1129-4df6-bc08-4fd2819c86a5"
		},
		"7df5e9a3-e03c-49d7-abee-cd7ffa01ee7e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask2.last.decision==\"reject\"}",
			"id": "sequenceflow15",
			"name": "Rejected",
			"sourceRef": "86377b1a-3e07-4acd-b6b6-3e2888159a40",
			"targetRef": "580b80e6-1f51-4d58-8cb1-16e167b46eb1"
		},
		"2313a560-0316-45b1-8f16-2eb39d073bfa": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "79.99999970197678,466 79.99999970197678,500.99999940395355 12,500.99999940395355 12,630.9999982118607 79.99999970197678,630.9999982118607 79.99999970197678,665.9999976158142",
			"sourceSymbol": "ceff7630-9a1a-4143-a3d7-d7afbe5df143",
			"targetSymbol": "2dd958bf-1e7c-4211-bc40-e364966737b9",
			"object": "7df5e9a3-e03c-49d7-abee-cd7ffa01ee7e"
		}
	}
}