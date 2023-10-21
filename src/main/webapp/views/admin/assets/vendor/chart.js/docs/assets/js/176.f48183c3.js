(window.webpackJsonp = window.webpackJsonp || []).push([[176], { 506: function(t, e, a) { "use strict"; a.r(e); var s = a(6), o = Object(s.a)({}, (function() { var t = this, e = t.$createElement, a = t._self._c || e; return a("ContentSlotsDistributor", { attrs: { "slot-key": t.$parent.slotKey } }, [a("h1", { attrs: { id: "options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#options" } }, [t._v("#")]), t._v(" Options")]), t._v(" "), a("h2", { attrs: { id: "option-resolution" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#option-resolution" } }, [t._v("#")]), t._v(" Option resolution")]), t._v(" "), a("p", [t._v("Options are resolved from top to bottom, using a context dependent route.")]), t._v(" "), a("h3", { attrs: { id: "chart-level-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#chart-level-options" } }, [t._v("#")]), t._v(" Chart level options")]), t._v(" "), a("ul", [a("li", [t._v("options")]), t._v(" "), a("li", [t._v("overrides["), a("code", [t._v("config.type")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults")])]), t._v(" "), a("h3", { attrs: { id: "dataset-level-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#dataset-level-options" } }, [t._v("#")]), t._v(" Dataset level options")]), t._v(" "), a("p", [a("code", [t._v("dataset.type")]), t._v(" defaults to "), a("code", [t._v("config.type")]), t._v(", if not specified.")]), t._v(" "), a("ul", [a("li", [t._v("dataset")]), t._v(" "), a("li", [t._v("options.datasets["), a("code", [t._v("dataset.type")]), t._v("]")]), t._v(" "), a("li", [t._v("options")]), t._v(" "), a("li", [t._v("overrides["), a("code", [t._v("config.type")]), t._v("].datasets["), a("code", [t._v("dataset.type")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults.datasets["), a("code", [t._v("dataset.type")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults")])]), t._v(" "), a("h3", { attrs: { id: "dataset-animation-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#dataset-animation-options" } }, [t._v("#")]), t._v(" Dataset animation options")]), t._v(" "), a("ul", [a("li", [t._v("dataset.animation")]), t._v(" "), a("li", [t._v("options.datasets["), a("code", [t._v("dataset.type")]), t._v("].animation")]), t._v(" "), a("li", [t._v("options.animation")]), t._v(" "), a("li", [t._v("overrides["), a("code", [t._v("config.type")]), t._v("].datasets["), a("code", [t._v("dataset.type")]), t._v("].animation")]), t._v(" "), a("li", [t._v("defaults.datasets["), a("code", [t._v("dataset.type")]), t._v("].animation")]), t._v(" "), a("li", [t._v("defaults.animation")])]), t._v(" "), a("h3", { attrs: { id: "dataset-element-level-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#dataset-element-level-options" } }, [t._v("#")]), t._v(" Dataset element level options")]), t._v(" "), a("p", [t._v("Each scope is looked up with "), a("code", [t._v("elementType")]), t._v(" prefix in the option name first, then without the prefix. For example, "), a("code", [t._v("radius")]), t._v(" for "), a("code", [t._v("point")]), t._v(" element is looked up using "), a("code", [t._v("pointRadius")]), t._v(" and if that does not hit, then "), a("code", [t._v("radius")]), t._v(".")]), t._v(" "), a("ul", [a("li", [t._v("dataset")]), t._v(" "), a("li", [t._v("options.datasets["), a("code", [t._v("dataset.type")]), t._v("]")]), t._v(" "), a("li", [t._v("options.datasets["), a("code", [t._v("dataset.type")]), t._v("].elements["), a("code", [t._v("elementType")]), t._v("]")]), t._v(" "), a("li", [t._v("options.elements["), a("code", [t._v("elementType")]), t._v("]")]), t._v(" "), a("li", [t._v("options")]), t._v(" "), a("li", [t._v("overrides["), a("code", [t._v("config.type")]), t._v("].datasets["), a("code", [t._v("dataset.type")]), t._v("]")]), t._v(" "), a("li", [t._v("overrides["), a("code", [t._v("config.type")]), t._v("].datasets["), a("code", [t._v("dataset.type")]), t._v("].elements["), a("code", [t._v("elementType")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults.datasets["), a("code", [t._v("dataset.type")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults.datasets["), a("code", [t._v("dataset.type")]), t._v("].elements["), a("code", [t._v("elementType")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults.elements["), a("code", [t._v("elementType")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults")])]), t._v(" "), a("h3", { attrs: { id: "scale-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#scale-options" } }, [t._v("#")]), t._v(" Scale options")]), t._v(" "), a("ul", [a("li", [t._v("options.scales")]), t._v(" "), a("li", [t._v("overrides["), a("code", [t._v("config.type")]), t._v("].scales")]), t._v(" "), a("li", [t._v("defaults.scales")]), t._v(" "), a("li", [t._v("defaults.scale")])]), t._v(" "), a("h3", { attrs: { id: "plugin-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#plugin-options" } }, [t._v("#")]), t._v(" Plugin options")]), t._v(" "), a("p", [t._v("A plugin can provide "), a("code", [t._v("additionalOptionScopes")]), t._v(" array of paths to additionally look for its options in. For root scope, use empty string: "), a("code", [t._v("''")]), t._v(". Most core plugins also take options from root scope.")]), t._v(" "), a("ul", [a("li", [t._v("options.plugins["), a("code", [t._v("plugin.id")]), t._v("]")]), t._v(" "), a("li", [t._v("(options.["), a("code", [t._v("...plugin.additionalOptionScopes")]), t._v("])")]), t._v(" "), a("li", [t._v("overrides["), a("code", [t._v("config.type")]), t._v("].plugins["), a("code", [t._v("plugin.id")]), t._v("]")]), t._v(" "), a("li", [t._v("defaults.plugins["), a("code", [t._v("plugin.id")]), t._v("]")]), t._v(" "), a("li", [t._v("(defaults.["), a("code", [t._v("...plugin.additionalOptionScopes")]), t._v("])")])]), t._v(" "), a("h2", { attrs: { id: "scriptable-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#scriptable-options" } }, [t._v("#")]), t._v(" Scriptable Options")]), t._v(" "), a("p", [t._v("Scriptable options also accept a function which is called for each of the underlying data values and that takes the unique argument "), a("code", [t._v("context")]), t._v(" representing contextual information (see "), a("RouterLink", { attrs: { to: "/general/options.html#option-context" } }, [t._v("option context")]), t._v(").\nA resolver is passed as second parameter, that can be used to access other options in the same context.")], 1), t._v(" "), a("div", { staticClass: "custom-block tip" }, [a("p", { staticClass: "custom-block-title" }, [t._v("Note")]), t._v(" "), a("p", [t._v("The "), a("code", [t._v("context")]), t._v(" argument should be validated in the scriptable function, because the function can be invoked in different contexts. The "), a("code", [t._v("type")]), t._v(" field is a good candidate for this validation.")])]), t._v(" "), a("p", [t._v("Example:")]), t._v(" "), a("div", { staticClass: "language-javascript extra-class" }, [a("pre", { pre: !0, attrs: { class: "language-javascript" } }, [a("code", [a("span", { pre: !0, attrs: { class: "token function-variable function" } }, [t._v("color")]), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v(":")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token keyword" } }, [t._v("function")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("(")]), a("span", { pre: !0, attrs: { class: "token parameter" } }, [t._v("context")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(")")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("{")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token keyword" } }, [t._v("const")]), t._v(" index "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v("=")]), t._v(" context"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(".")]), t._v("dataIndex"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(";")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token keyword" } }, [t._v("const")]), t._v(" value "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v("=")]), t._v(" context"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(".")]), t._v("dataset"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(".")]), t._v("data"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("[")]), t._v("index"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("]")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(";")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token keyword" } }, [t._v("return")]), t._v(" value "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v("<")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token number" } }, [t._v("0")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v("?")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token string" } }, [t._v("'red'")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v(":")]), t._v("  "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("// draw negative values in red")]), t._v("\n        index "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v("%")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token number" } }, [t._v("2")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v("?")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token string" } }, [t._v("'blue'")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v(":")]), t._v("    "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("// else, alternate values in blue and green")]), t._v("\n        "), a("span", { pre: !0, attrs: { class: "token string" } }, [t._v("'green'")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(";")]), t._v("\n"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("}")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(",")]), t._v("\n"), a("span", { pre: !0, attrs: { class: "token function-variable function" } }, [t._v("borderColor")]), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v(":")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token keyword" } }, [t._v("function")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("(")]), a("span", { pre: !0, attrs: { class: "token parameter" } }, [t._v("context"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(",")]), t._v(" options")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(")")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("{")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token keyword" } }, [t._v("const")]), t._v(" color "), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v("=")]), t._v(" options"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(".")]), t._v("color"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(";")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("// resolve the value of another scriptable option: 'red', 'blue' or 'green'")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token keyword" } }, [t._v("return")]), t._v(" Chart"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(".")]), t._v("helpers"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(".")]), a("span", { pre: !0, attrs: { class: "token function" } }, [t._v("color")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("(")]), t._v("color"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(")")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(".")]), a("span", { pre: !0, attrs: { class: "token function" } }, [t._v("lighten")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("(")]), a("span", { pre: !0, attrs: { class: "token number" } }, [t._v("0.2")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(")")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(";")]), t._v("\n"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("}")]), t._v("\n")])])]), a("h2", { attrs: { id: "indexable-options" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#indexable-options" } }, [t._v("#")]), t._v(" Indexable Options")]), t._v(" "), a("p", [t._v("Indexable options also accept an array in which each item corresponds to the element at the same index. Note that if there are less items than data, the items are looped over. In many cases, using a "), a("a", { attrs: { href: "#scriptable-options" } }, [t._v("function")]), t._v(" is more appropriate if supported.")]), t._v(" "), a("p", [t._v("Example:")]), t._v(" "), a("div", { staticClass: "language-javascript extra-class" }, [a("pre", { pre: !0, attrs: { class: "language-javascript" } }, [a("code", [a("span", { pre: !0, attrs: { class: "token literal-property property" } }, [t._v("color")]), a("span", { pre: !0, attrs: { class: "token operator" } }, [t._v(":")]), t._v(" "), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("[")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token string" } }, [t._v("'red'")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(",")]), t._v("    "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("// color for data at index 0")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token string" } }, [t._v("'blue'")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(",")]), t._v("   "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("// color for data at index 1")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token string" } }, [t._v("'green'")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(",")]), t._v("  "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("// color for data at index 2")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token string" } }, [t._v("'black'")]), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v(",")]), t._v("  "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("// color for data at index 3")]), t._v("\n    "), a("span", { pre: !0, attrs: { class: "token comment" } }, [t._v("//...")]), t._v("\n"), a("span", { pre: !0, attrs: { class: "token punctuation" } }, [t._v("]")]), t._v("\n")])])]), a("h2", { attrs: { id: "option-context" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#option-context" } }, [t._v("#")]), t._v(" Option Context")]), t._v(" "), a("p", [t._v("The option context is used to give contextual information when resolving options and currently only applies to "), a("a", { attrs: { href: "#scriptable-options" } }, [t._v("scriptable options")]), t._v(".\nThe object is preserved, so it can be used to store and pass information between calls.")]), t._v(" "), a("p", [t._v("There are multiple levels of context objects:")]), t._v(" "), a("ul", [a("li", [a("code", [t._v("chart")]), t._v(" "), a("ul", [a("li", [a("code", [t._v("dataset")]), t._v(" "), a("ul", [a("li", [a("code", [t._v("data")])])])]), t._v(" "), a("li", [a("code", [t._v("scale")]), t._v(" "), a("ul", [a("li", [a("code", [t._v("tick")])]), t._v(" "), a("li", [a("code", [t._v("pointLabel")]), t._v(" (only used in the radial linear scale)")])])]), t._v(" "), a("li", [a("code", [t._v("tooltip")])])])])]), t._v(" "), a("p", [t._v("Each level inherits its parent(s) and any contextual information stored in the parent is available through the child.")]), t._v(" "), a("p", [t._v("The context object contains the following properties:")]), t._v(" "), a("h3", { attrs: { id: "chart" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#chart" } }, [t._v("#")]), t._v(" chart")]), t._v(" "), a("ul", [a("li", [a("code", [t._v("chart")]), t._v(": the associated chart")]), t._v(" "), a("li", [a("code", [t._v("type")]), t._v(": "), a("code", [t._v("'chart'")])])]), t._v(" "), a("h3", { attrs: { id: "dataset" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#dataset" } }, [t._v("#")]), t._v(" dataset")]), t._v(" "), a("p", [t._v("In addition to "), a("a", { attrs: { href: "#chart" } }, [t._v("chart")])]), t._v(" "), a("ul", [a("li", [a("code", [t._v("active")]), t._v(": true if element is active (hovered)")]), t._v(" "), a("li", [a("code", [t._v("dataset")]), t._v(": dataset at index "), a("code", [t._v("datasetIndex")])]), t._v(" "), a("li", [a("code", [t._v("datasetIndex")]), t._v(": index of the current dataset")]), t._v(" "), a("li", [a("code", [t._v("index")]), t._v(": same as "), a("code", [t._v("datasetIndex")])]), t._v(" "), a("li", [a("code", [t._v("mode")]), t._v(": the update mode")]), t._v(" "), a("li", [a("code", [t._v("type")]), t._v(": "), a("code", [t._v("'dataset'")])])]), t._v(" "), a("h3", { attrs: { id: "data" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#data" } }, [t._v("#")]), t._v(" data")]), t._v(" "), a("p", [t._v("In addition to "), a("a", { attrs: { href: "#dataset" } }, [t._v("dataset")])]), t._v(" "), a("ul", [a("li", [a("code", [t._v("active")]), t._v(": true if element is active (hovered)")]), t._v(" "), a("li", [a("code", [t._v("dataIndex")]), t._v(": index of the current data")]), t._v(" "), a("li", [a("code", [t._v("parsed")]), t._v(": the parsed data values for the given "), a("code", [t._v("dataIndex")]), t._v(" and "), a("code", [t._v("datasetIndex")])]), t._v(" "), a("li", [a("code", [t._v("raw")]), t._v(": the raw data values for the given "), a("code", [t._v("dataIndex")]), t._v(" and "), a("code", [t._v("datasetIndex")])]), t._v(" "), a("li", [a("code", [t._v("element")]), t._v(": the element (point, arc, bar, etc.) for this data")]), t._v(" "), a("li", [a("code", [t._v("index")]), t._v(": same as "), a("code", [t._v("dataIndex")])]), t._v(" "), a("li", [a("code", [t._v("type")]), t._v(": "), a("code", [t._v("'data'")])])]), t._v(" "), a("h3", { attrs: { id: "scale" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#scale" } }, [t._v("#")]), t._v(" scale")]), t._v(" "), a("p", [t._v("In addition to "), a("a", { attrs: { href: "#chart" } }, [t._v("chart")])]), t._v(" "), a("ul", [a("li", [a("code", [t._v("scale")]), t._v(": the associated scale")]), t._v(" "), a("li", [a("code", [t._v("type")]), t._v(": "), a("code", [t._v("'scale'")])])]), t._v(" "), a("h3", { attrs: { id: "tick" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#tick" } }, [t._v("#")]), t._v(" tick")]), t._v(" "), a("p", [t._v("In addition to "), a("a", { attrs: { href: "#scale" } }, [t._v("scale")])]), t._v(" "), a("ul", [a("li", [a("code", [t._v("tick")]), t._v(": the associated tick object")]), t._v(" "), a("li", [a("code", [t._v("index")]), t._v(": tick index")]), t._v(" "), a("li", [a("code", [t._v("type")]), t._v(": "), a("code", [t._v("'tick'")])])]), t._v(" "), a("h3", { attrs: { id: "tooltip" } }, [a("a", { staticClass: "header-anchor", attrs: { href: "#tooltip" } }, [t._v("#")]), t._v(" tooltip")]), t._v(" "), a("p", [t._v("In addition to "), a("a", { attrs: { href: "#chart" } }, [t._v("chart")])]), t._v(" "), a("ul", [a("li", [a("code", [t._v("tooltip")]), t._v(": the tooltip object")]), t._v(" "), a("li", [a("code", [t._v("tooltipItems")]), t._v(": the items the tooltip is displaying")])])]) }), [], !1, null, null, null); e.default = o.exports } }]);