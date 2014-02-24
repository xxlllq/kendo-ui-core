<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<demo:header />

<kendo:sortable name="#sortable-left" connectWith="#sortable-right"
	hint="hint" placeholder="placeholder" start="onStart" move="onMove"
	end="onEnd" change="onChange" cancel="onCancel">
</kendo:sortable>

<kendo:sortable name="#sortable-right" connectWith="#sortable-left"
	hint="hint" placeholder="placeholder" start="onStart" move="onMove"
	end="onEnd" change="onChange" cancel="onCancel">
</kendo:sortable>

<div class="demo-section list-wrapper">
	<h3 class="title">Reorder Items</h3>
	<ul id="sortable-left" style="min-height: 41px;">
		<li class="list-left">Item 1</li>
		<li class="list-left">Item 2</li>
		<li class="list-left">Item 3</li>
	</ul>

	<ul id="sortable-right" style="min-height: 41px;">
		<li class="list-right">Item 1</li>
		<li class="list-right">Item 2</li>
		<li class="list-right">Item 3</li>
	</ul>
</div>

<div class="demo-section">
	<h3 class="title">Console log</h3>
	<div class="console"></div>
</div>

<script>
	function hint(element) {
		return element.clone().addClass("hint");
	}

	function placeholder(element) {
		return element.clone().addClass("placeholder");
	}
	
	function onMove(e) {
        var id = e.sender.element.attr("id"),
            placeholder = e.list.placeholder;

        kendoConsole.log(id + " move to index: " + this.indexOf(placeholder));
    }
	
    function onStart(e) {
        var id = e.sender.element.attr("id");
        kendoConsole.log(id + " start: " + e.item.text());
    }

    function onEnd(e) {
        var id = e.sender.element.attr("id"),
            text = e.item.text(),
            oldIndex = e.oldIndex,
            newIndex = e.newIndex;

        kendoConsole.log(id + " end: " + text + " oldIndex: " + oldIndex + " newIndex: " + newIndex + " action: " + e.action);
    }

    function onChange(e) {
        var id = e.sender.element.attr("id"),
            text = e.item.text(),
            newIndex = e.newIndex,
            oldIndex = e.oldIndex;

        kendoConsole.log(id + " change: " + text + " newIndex: " + newIndex + " oldIndex: " + oldIndex + " action: " + e.action);
    }

    function onCancel(e) {
        kendoConsole.log("cancel");
    }
</script>

<style>
.demo-section {
	width: 600px;
	text-align: center;
}

.console {
	margin: 0;
}

#example {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.list-wrapper {
	overflow: hidden;
}

#sortable-left,#sortable-right {
	width: 200px;
	margin-left: 70px;
	padding: 0;
	float: left;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.list-right,.list-left {
	list-style-type: none;
	margin: 5px;
	width: 168px;
	padding: 8px 10px;
	text-align: center;
	color: #ffffff;
	border: 1px solid transparent;
	border-radius: 4px;
	cursor: -webkit-grab;
	cursor: -moz-grab;
	cursor: url(https://mail.google.com/mail/images/2/openhand.cur) 8, 8,
		move;
}

.list-left {
	background-color: #52aef7;
}

.list-right {
	background-color: #e62757;
}

.placeholder {
	border: 1px dashed #ccc;
	background-color: #fff;
	color: #333;
}

.hint {
	opacity: 0.4;
	cursor: -webkit-grabbing;
	cursor: -moz-grabbing;
	cursor: url(https://mail.google.com/mail/images/2/closehand.cur) 8, 8,
		move;
}
</style>

<demo:footer />