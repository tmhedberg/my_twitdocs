$(function() {
    var attr_ct = 0;
    $("#add-attr").click(function() {
        $("#attrs").append(
            "<br><input type='text' name='document[attrs][" +
                attr_ct +
                "][name]'><input type='text' name='document[attrs][" +
                attr_ct++ +
                "][val]'>"
        );
    });
});
