import AppendScripts from "./AppendScripts";

const JqueryUi = () => {
    let scripts = '$("#slider-range").length &&\n' +
        '        $("#slider-range").slider({\n' +
        '            range: !0,\n' +
        '            min: 0,\n' +
        '            max: 50000,\n' +
        '            values: [40, 1000],\n' +
        '            slide: function (t, l) {\n' +
        '                $("#amount").val("$" + l.values[0] + " - $" + l.values[1]);\n' +
        '            },\n' +
        '        }),\n' +
        '            $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));';
    AppendScripts(scripts);
}

export default JqueryUi;