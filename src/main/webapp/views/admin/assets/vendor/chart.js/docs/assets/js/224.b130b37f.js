(window.webpackJsonp = window.webpackJsonp || []).push([[224], { 555: function(t, n, e) { "use strict"; e.r(n); var a = e(6), l = Object(a.a)({}, (function() { var t = this, n = t.$createElement, e = t._self._c || n; return e("ContentSlotsDistributor", { attrs: { "slot-key": t.$parent.slotKey } }, [e("h1", { attrs: { id: "multi-series-pie" } }, [e("a", { staticClass: "header-anchor", attrs: { href: "#multi-series-pie" } }, [t._v("#")]), t._v(" Multi Series Pie")]), t._v(" "), e("chart-editor", { attrs: { code: "// <block:setup:1>\nconst DATA_COUNT = 5;\nconst NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};\n\nconst labels = Utils.months({count: 7});\nconst data = {\n  labels: ['Overall Yay', 'Overall Nay', 'Group A Yay', 'Group A Nay', 'Group B Yay', 'Group B Nay', 'Group C Yay', 'Group C Nay'],\n  datasets: [\n    {\n      backgroundColor: ['#AAA', '#777'],\n      data: [21, 79]\n    },\n    {\n      backgroundColor: ['hsl(0, 100%, 60%)', 'hsl(0, 100%, 35%)'],\n      data: [33, 67]\n    },\n    {\n      backgroundColor: ['hsl(100, 100%, 60%)', 'hsl(100, 100%, 35%)'],\n      data: [20, 80]\n    },\n    {\n      backgroundColor: ['hsl(180, 100%, 60%)', 'hsl(180, 100%, 35%)'],\n      data: [10, 90]\n    }\n  ]\n};\n// </block:setup>\n\n// <block:config:0>\nconst config = {\n  type: 'pie',\n  data: data,\n  options: {\n    responsive: true,\n    plugins: {\n      legend: {\n        labels: {\n          generateLabels: function(chart) {\n            // Get the default label list\n            const original = Chart.overrides.pie.plugins.legend.labels.generateLabels;\n            const labelsOriginal = original.call(this, chart);\n\n            // Build an array of colors used in the datasets of the chart\n            let datasetColors = chart.data.datasets.map(function(e) {\n              return e.backgroundColor;\n            });\n            datasetColors = datasetColors.flat();\n\n            // Modify the color and hide state of each label\n            labelsOriginal.forEach(label => {\n              // There are twice as many labels as there are datasets. This converts the label index into the corresponding dataset index\n              label.datasetIndex = (label.index - label.index % 2) / 2;\n\n              // The hidden state must match the dataset's hidden state\n              label.hidden = !chart.isDatasetVisible(label.datasetIndex);\n\n              // Change the color to match the dataset\n              label.fillStyle = datasetColors[label.index];\n            });\n\n            return labelsOriginal;\n          }\n        },\n        onClick: function(mouseEvent, legendItem, legend) {\n          // toggle the visibility of the dataset from what it currently is\n          legend.chart.getDatasetMeta(\n            legendItem.datasetIndex\n          ).hidden = legend.chart.isDatasetVisible(legendItem.datasetIndex);\n          legend.chart.update();\n        }\n      },\n      tooltip: {\n        callbacks: {\n          label: function(context) {\n            const labelIndex = (context.datasetIndex * 2) + context.dataIndex;\n            return context.chart.data.labels[labelIndex] + ': ' + context.formattedValue;\n          }\n        }\n      }\n    }\n  },\n};\n// </block:config>\n\nmodule.exports = {\n  config: config,\n};\n" } }), e("h2", { attrs: { id: "docs" } }, [e("a", { staticClass: "header-anchor", attrs: { href: "#docs" } }, [t._v("#")]), t._v(" Docs")]), t._v(" "), e("ul", [e("li", [e("RouterLink", { attrs: { to: "/charts/doughnut.html" } }, [t._v("Doughnut and Pie Charts")])], 1), t._v(" "), e("li", [e("RouterLink", { attrs: { to: "/general/options.html" } }, [t._v("Options")]), t._v(" "), e("ul", [e("li", [e("RouterLink", { attrs: { to: "/general/options.html#scriptable-options" } }, [t._v("Scriptable Options")])], 1)])], 1)])], 1) }), [], !1, null, null, null); n.default = l.exports } }]);