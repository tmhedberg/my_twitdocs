$(function() {
    var attr_ct = 0;
    $("#add-attr").click(function() {
        $("#attrs").append(
            "<br><input type='text' name='document[name-" +
                attr_ct +
                "]'><input type='text' name='document[val-" +
                attr_ct++ +
                "]'>"
        );
    });
});
