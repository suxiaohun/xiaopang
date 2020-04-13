/*! jQuery v1.9.1 | (c) jQuery Foundation | jquery.org/license */
(function(r, n) {
        function Ba(a) {
            var b = a.length
                , d = c.type(a);
            return c.isWindow(a) ? !1 : 1 === a.nodeType && b ? !0 : "array" === d || "function" !== d && (0 === b || "number" === typeof b && 0 < b && b - 1 in a)
        }
        function Sb(a) {
            var b = Va[a] = {};
            c.each(a.match(R) || [], function(a, c) {
                b[c] = !0
            });
            return b
        }
        function Wa(a, b, d, e) {
            if (c.acceptData(a)) {
                var f = c.expando
                    , g = "string" === typeof b
                    , h = a.nodeType
                    , k = h ? c.cache : a
                    , l = h ? a[f] : a[f] && f;
                if (l && k[l] && (e || k[l].data) || !g || d !== n) {
                    l || (h ? a[f] = l = aa.pop() || c.guid++ : l = f);
                    k[l] || (k[l] = {},
                    h || (k[l].toJSON = c.noop));
                    if ("object" === typeof b || "function" === typeof b)
                        e ? k[l] = c.extend(k[l], b) : k[l].data = c.extend(k[l].data, b);
                    a = k[l];
                    e || (a.data || (a.data = {}),
                        a = a.data);
                    d !== n && (a[c.camelCase(b)] = d);
                    g ? (d = a[b],
                    null == d && (d = a[c.camelCase(b)])) : d = a;
                    return d
                }
            }
        }
        function Xa(a, b, d) {
            if (c.acceptData(a)) {
                var e, f, g = a.nodeType, h = g ? c.cache : a, k = g ? a[c.expando] : c.expando;
                if (h[k]) {
                    if (b && (f = d ? h[k] : h[k].data)) {
                        c.isArray(b) ? b = b.concat(c.map(b, c.camelCase)) : b in f ? b = [b] : (b = c.camelCase(b),
                            b = b in f ? [b] : b.split(" "));
                        var l = 0;
                        for (e = b.length; l < e; l++)
                            delete f[b[l]];
                        if (!(d ? Ca : c.isEmptyObject)(f))
                            return
                    }
                    if (!d && (delete h[k].data,
                        !Ca(h[k])))
                        return;
                    g ? c.cleanData([a], !0) : c.support.deleteExpando || h != h.window ? delete h[k] : h[k] = null
                }
            }
        }
        function Ya(a, b, d) {
            if (d === n && 1 === a.nodeType)
                if (d = "data-" + b.replace(Tb, "-$1").toLowerCase(),
                    d = a.getAttribute(d),
                "string" === typeof d) {
                    try {
                        d = "true" === d ? !0 : "false" === d ? !1 : "null" === d ? null : +d + "" === d ? +d : Ub.test(d) ? c.parseJSON(d) : d
                    } catch (e) {}
                    c.data(a, b, d)
                } else
                    d = n;
            return d
        }
        function Ca(a) {
            for (var b in a)
                if (("data" !== b || !c.isEmptyObject(a[b])) && "toJSON" !== b)
                    return !1;
            return !0
        }
        function qa() {
            return !0
        }
        function W() {
            return !1
        }
        function Za(a, b) {
            do
                a = a[b];
            while (a && 1 !== a.nodeType);return a
        }
        function $a(a, b, d) {
            b = b || 0;
            if (c.isFunction(b))
                return c.grep(a, function(a, c) {
                    return !!b.call(a, c, a) === d
                });
            if (b.nodeType)
                return c.grep(a, function(a) {
                    return a === b === d
                });
            if ("string" === typeof b) {
                var e = c.grep(a, function(a) {
                    return 1 === a.nodeType
                });
                if (Vb.test(b))
                    return c.filter(b, e, !d);
                b = c.filter(b, e)
            }
            return c.grep(a, function(a) {
                return 0 <= c.inArray(a, b) === d
            })
        }
        function ab(a) {
            var b = bb.split("|");
            a = a.createDocumentFragment();
            if (a.createElement)
                for (; b.length; )
                    a.createElement(b.pop());
            return a
        }
        function Wb(a, b) {
            return a.getElementsByTagName(b)[0] || a.appendChild(a.ownerDocument.createElement(b))
        }
        function cb(a) {
            var b = a.getAttributeNode("type");
            a.type = (b && b.specified) + "/" + a.type;
            return a
        }
        function db(a) {
            var b = Xb.exec(a.type);
            b ? a.type = b[1] : a.removeAttribute("type");
            return a
        }
        function Da(a, b) {
            for (var d, e = 0; null != (d = a[e]); e++)
                c._data(d, "globalEval", !b || c._data(b[e], "globalEval"))
        }
        function eb(a, b) {
            if (1 === b.nodeType && c.hasData(a)) {
                var d, e;
                var f = c._data(a);
                a = c._data(b, f);
                var g = f.events;
                if (g)
                    for (d in delete a.handle,
                        a.events = {},
                        g)
                        for (f = 0,
                                 e = g[d].length; f < e; f++)
                            c.event.add(b, d, g[d][f]);
                a.data && (a.data = c.extend({}, a.data))
            }
        }
        function x(a, b) {
            var d, e, f = 0, g = typeof a.getElementsByTagName !== H ? a.getElementsByTagName(b || "*") : typeof a.querySelectorAll !== H ? a.querySelectorAll(b || "*") : n;
            if (!g)
                for (g = [],
                         d = a.childNodes || a; null != (e = d[f]); f++)
                    !b || c.nodeName(e, b) ? g.push(e) : c.merge(g, x(e, b));
            return b === n || b && c.nodeName(a, b) ? c.merge([a], g) : g
        }
        function Yb(a) {
            Ea.test(a.type) && (a.defaultChecked = a.checked)
        }
        function fb(a, b) {
            if (b in a)
                return b;
            for (var c = b.charAt(0).toUpperCase() + b.slice(1), e = b, f = gb.length; f--; )
                if (b = gb[f] + c,
                b in a)
                    return b;
            return e
        }
        function X(a, b) {
            a = b || a;
            return "none" === c.css(a, "display") || !c.contains(a.ownerDocument, a)
        }
        function hb(a, b) {
            for (var d, e, f, g = [], h = 0, k = a.length; h < k; h++)
                e = a[h],
                e.style && (g[h] = c._data(e, "olddisplay"),
                    d = e.style.display,
                    b ? (g[h] || "none" !== d || (e.style.display = ""),
                    "" === e.style.display && X(e) && (g[h] = c._data(e, "olddisplay", ib(e.nodeName)))) : g[h] || (f = X(e),
                    (d && "none" !== d || !f) && c._data(e, "olddisplay", f ? d : c.css(e, "display"))));
            for (h = 0; h < k; h++)
                e = a[h],
                !e.style || b && "none" !== e.style.display && "" !== e.style.display || (e.style.display = b ? g[h] || "" : "none");
            return a
        }
        function jb(a, b, c) {
            return (a = Zb.exec(b)) ? Math.max(0, a[1] - (c || 0)) + (a[2] || "px") : b
        }
        function kb(a, b, d, e, f) {
            b = d === (e ? "border" : "content") ? 4 : "width" === b ? 1 : 0;
            for (var g = 0; 4 > b; b += 2)
                "margin" === d && (g += c.css(a, d + ba[b], !0, f)),
                    e ? ("content" === d && (g -= c.css(a, "padding" + ba[b], !0, f)),
                    "margin" !== d && (g -= c.css(a, "border" + ba[b] + "Width", !0, f))) : (g += c.css(a, "padding" + ba[b], !0, f),
                    "padding" !== d && (g += c.css(a, "border" + ba[b] + "Width", !0, f)));
            return g
        }
        function lb(a, b, d) {
            var e = !0
                , f = "width" === b ? a.offsetWidth : a.offsetHeight
                , g = S(a)
                , h = c.support.boxSizing && "border-box" === c.css(a, "boxSizing", !1, g);
            if (0 >= f || null == f) {
                f = ea(a, b, g);
                if (0 > f || null == f)
                    f = a.style[b];
                if (ra.test(f))
                    return f;
                e = h && (c.support.boxSizingReliable || f === a.style[b]);
                f = parseFloat(f) || 0
            }
            return f + kb(a, b, d || (h ? "border" : "content"), e, g) + "px"
        }
        function ib(a) {
            var b = q
                , d = mb[a];
            d || (d = nb(a, b),
            "none" !== d && d || (ca = (ca || c("<iframe frameborder='0' width='0' height='0'/>").css("cssText", "display:block !important")).appendTo(b.documentElement),
                b = (ca[0].contentWindow || ca[0].contentDocument).document,
                b.write("<!doctype html><html><body>"),
                b.close(),
                d = nb(a, b),
                ca.detach()),
                mb[a] = d);
            return d
        }
        function nb(a, b) {
            a = c(b.createElement(a)).appendTo(b.body);
            b = c.css(a[0], "display");
            a.remove();
            return b
        }
        function Fa(a, b, d, e) {
            var f;
            if (c.isArray(b))
                c.each(b, function(b, c) {
                    d || $b.test(a) ? e(a, c) : Fa(a + "[" + ("object" === typeof c ? b : "") + "]", c, d, e)
                });
            else if (d || "object" !== c.type(b))
                e(a, b);
            else
                for (f in b)
                    Fa(a + "[" + f + "]", b[f], d, e)
        }
        function ob(a) {
            return function(b, d) {
                "string" !== typeof b && (d = b,
                    b = "*");
                var e = 0
                    , f = b.toLowerCase().match(R) || [];
                if (c.isFunction(d))
                    for (; b = f[e++]; )
                        "+" === b[0] ? (b = b.slice(1) || "*",
                            (a[b] = a[b] || []).unshift(d)) : (a[b] = a[b] || []).push(d)
            }
        }
        function pb(a, b, d, e) {
            function f(k) {
                var l;
                g[k] = !0;
                c.each(a[k] || [], function(a, c) {
                    a = c(b, d, e);
                    if ("string" === typeof a && !h && !g[a])
                        return b.dataTypes.unshift(a),
                            f(a),
                            !1;
                    if (h)
                        return !(l = a)
                });
                return l
            }
            var g = {}
                , h = a === Ga;
            return f(b.dataTypes[0]) || !g["*"] && f("*")
        }
        function Ha(a, b) {
            var d, e, f = c.ajaxSettings.flatOptions || {};
            for (e in b)
                b[e] !== n && ((f[e] ? a : d || (d = {}))[e] = b[e]);
            d && c.extend(!0, a, d);
            return a
        }
        function qb() {
            try {
                return new r.XMLHttpRequest
            } catch (a) {}
        }
        function rb() {
            setTimeout(function() {
                fa = n
            });
            return fa = c.now()
        }
        function ac(a, b) {
            c.each(b, function(b, c) {
                for (var d = (da[b] || []).concat(da["*"]), e = 0, h = d.length; e < h && !d[e].call(a, b, c); e++)
                    ;
            })
        }
        function sb(a, b, d) {
            var e, f = 0, g = sa.length, h = c.Deferred().always(function() {
                delete k.elem
            }), k = function() {
                if (e)
                    return !1;
                var b = fa || rb();
                b = Math.max(0, l.startTime + l.duration - b);
                for (var c = 1 - (b / l.duration || 0), d = 0, f = l.tweens.length; d < f; d++)
                    l.tweens[d].run(c);
                h.notifyWith(a, [l, c, b]);
                if (1 > c && f)
                    return b;
                h.resolveWith(a, [l]);
                return !1
            }, l = h.promise({
                elem: a,
                props: c.extend({}, b),
                opts: c.extend(!0, {
                    specialEasing: {}
                }, d),
                originalProperties: b,
                originalOptions: d,
                startTime: fa || rb(),
                duration: d.duration,
                tweens: [],
                createTween: function(b, d) {
                    b = c.Tween(a, l.opts, b, d, l.opts.specialEasing[b] || l.opts.easing);
                    l.tweens.push(b);
                    return b
                },
                stop: function(b) {
                    var c = 0
                        , d = b ? l.tweens.length : 0;
                    if (e)
                        return this;
                    for (e = !0; c < d; c++)
                        l.tweens[c].run(1);
                    b ? h.resolveWith(a, [l, b]) : h.rejectWith(a, [l, b]);
                    return this
                }
            });
            d = l.props;
            for (bc(d, l.opts.specialEasing); f < g; f++)
                if (b = sa[f].call(l, a, d, l.opts))
                    return b;
            ac(l, d);
            c.isFunction(l.opts.start) && l.opts.start.call(a, l);
            c.fx.timer(c.extend(k, {
                elem: a,
                anim: l,
                queue: l.opts.queue
            }));
            return l.progress(l.opts.progress).done(l.opts.done, l.opts.complete).fail(l.opts.fail).always(l.opts.always)
        }
        function bc(a, b) {
            var d, e;
            for (d in a) {
                var f = c.camelCase(d);
                var g = b[f];
                var h = a[d];
                c.isArray(h) && (g = h[1],
                    h = a[d] = h[0]);
                d !== f && (a[f] = h,
                    delete a[d]);
                if ((e = c.cssHooks[f]) && "expand"in e)
                    for (d in h = e.expand(h),
                        delete a[f],
                        h)
                        d in a || (a[d] = h[d],
                            b[d] = g);
                else
                    b[f] = g
            }
        }
        function D(a, b, c, e, f) {
            return new D.prototype.init(a,b,c,e,f)
        }
        function ta(a, b) {
            var c = {
                height: a
            }
                , e = 0;
            for (b = b ? 1 : 0; 4 > e; e += 2 - b) {
                var f = ba[e];
                c["margin" + f] = c["padding" + f] = a
            }
            b && (c.opacity = c.width = a);
            return c
        }
        function tb(a) {
            return c.isWindow(a) ? a : 9 === a.nodeType ? a.defaultView || a.parentWindow : !1
        }
        var ha, H = typeof n, q = r.document, cc = r.location, dc = r.jQuery, ec = r.$, ma = {}, aa = [], ub = aa.concat, Ia = aa.push, O = aa.slice, vb = aa.indexOf, fc = ma.toString, na = ma.hasOwnProperty, Ja = "2.0".trim, c = function(a, b) {
            return new c.fn.init(a,b,gc)
        }, xa = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source, R = /\S+/g, hc = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, ic = /^(?:(<[\w\W]+>)[^>]*|#([\w-]*))$/, wb = /^<(\w+)\s*\/?>(?:<\/\1>|)$/, jc = /^[\],:{}\s]*$/, kc = /(?:^|:|,)(?:\s*\[)+/g, lc = /\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g, mc = /"[^"\\\r\n]*"|true|false|null|-?(?:\d+\.|)\d+(?:[eE][+-]?\d+|)/g, nc = /^-ms-/, oc = /-([\da-z])/gi, pc = function(a, b) {
            return b.toUpperCase()
        }, F = function(a) {
            if (q.addEventListener || "load" === a.type || "complete" === q.readyState)
                xb(),
                    c.ready()
        }, xb = function() {
            q.addEventListener ? (q.removeEventListener("DOMContentLoaded", F, !1),
                r.removeEventListener("load", F, !1)) : (q.detachEvent("onreadystatechange", F),
                r.detachEvent("onload", F))
        };
        c.fn = c.prototype = {
            jquery: "2.0",
            constructor: c,
            init: function(a, b, d) {
                if (!a)
                    return this;
                if ("string" === typeof a) {
                    var e = "<" === a.charAt(0) && ">" === a.charAt(a.length - 1) && 3 <= a.length ? [null, a, null] : ic.exec(a);
                    if (!e || !e[1] && b)
                        return !b || b.jquery ? (b || d).find(a) : this.constructor(b).find(a);
                    if (e[1]) {
                        if (b instanceof c && (b = b[0]),
                            c.merge(this, c.parseHTML(e[1], b && b.nodeType ? b.ownerDocument || b : q, !0)),
                        wb.test(e[1]) && c.isPlainObject(b))
                            for (e in b)
                                if (c.isFunction(this[e]))
                                    this[e](b[e]);
                                else
                                    this.attr(e, b[e])
                    } else {
                        if ((b = q.getElementById(e[2])) && b.parentNode) {
                            if (b.id !== e[2])
                                return d.find(a);
                            this.length = 1;
                            this[0] = b
                        }
                        this.context = q;
                        this.selector = a
                    }
                    return this
                }
                if (a.nodeType)
                    return this.context = this[0] = a,
                        this.length = 1,
                        this;
                if (c.isFunction(a))
                    return d.ready(a);
                a.selector !== n && (this.selector = a.selector,
                    this.context = a.context);
                return c.makeArray(a, this)
            },
            selector: "",
            length: 0,
            size: function() {
                return this.length
            },
            toArray: function() {
                return O.call(this)
            },
            get: function(a) {
                return null == a ? this.toArray() : 0 > a ? this[this.length + a] : this[a]
            },
            pushStack: function(a) {
                a = c.merge(this.constructor(), a);
                a.prevObject = this;
                a.context = this.context;
                return a
            },
            each: function(a, b) {
                return c.each(this, a, b)
            },
            ready: function(a) {
                c.ready.promise().done(a);
                return this
            },
            slice: function() {
                return this.pushStack(O.apply(this, arguments))
            },
            first: function() {
                return this.eq(0)
            },
            last: function() {
                return this.eq(-1)
            },
            eq: function(a) {
                var b = this.length;
                a = +a + (0 > a ? b : 0);
                return this.pushStack(0 <= a && a < b ? [this[a]] : [])
            },
            map: function(a) {
                return this.pushStack(c.map(this, function(b, c) {
                    return a.call(b, c, b)
                }))
            },
            end: function() {
                return this.prevObject || this.constructor(null)
            },
            push: Ia,
            sort: [].sort,
            splice: [].splice
        };
        c.fn.init.prototype = c.fn;
        c.extend = c.fn.extend = function() {
            var a, b, d, e = arguments[0] || {}, f = 1, g = arguments.length, h = !1;
            "boolean" === typeof e && (h = e,
                e = arguments[1] || {},
                f = 2);
            "object" === typeof e || c.isFunction(e) || (e = {});
            g === f && (e = this,
                --f);
            for (; f < g; f++)
                if (null != (d = arguments[f]))
                    for (b in d) {
                        var k = e[b];
                        var l = d[b];
                        e !== l && (h && l && (c.isPlainObject(l) || (a = c.isArray(l))) ? (a ? (a = !1,
                            k = k && c.isArray(k) ? k : []) : k = k && c.isPlainObject(k) ? k : {},
                            e[b] = c.extend(h, k, l)) : l !== n && (e[b] = l))
                    }
            return e
        }
        ;
        c.extend({
            noConflict: function(a) {
                r.$ === c && (r.$ = ec);
                a && r.jQuery === c && (r.jQuery = dc);
                return c
            },
            isReady: !1,
            readyWait: 1,
            holdReady: function(a) {
                a ? c.readyWait++ : c.ready(!0)
            },
            ready: function(a) {
                if (!0 === a ? !--c.readyWait : !c.isReady) {
                    if (!q.body)
                        return setTimeout(c.ready);
                    c.isReady = !0;
                    !0 !== a && 0 < --c.readyWait || (ha.resolveWith(q, [c]),
                    c.fn.trigger && c(q).trigger("ready").off("ready"))
                }
            },
            isFunction: function(a) {
                return "function" === c.type(a)
            },
            isArray: Array.isArray || function(a) {
                return "array" === c.type(a)
            }
            ,
            isWindow: function(a) {
                return null != a && a == a.window
            },
            isNumeric: function(a) {
                return !isNaN(parseFloat(a)) && isFinite(a)
            },
            type: function(a) {
                return null == a ? String(a) : "object" === typeof a || "function" === typeof a ? ma[fc.call(a)] || "object" : typeof a
            },
            isPlainObject: function(a) {
                if (!a || "object" !== c.type(a) || a.nodeType || c.isWindow(a))
                    return !1;
                try {
                    if (a.constructor && !na.call(a, "constructor") && !na.call(a.constructor.prototype, "isPrototypeOf"))
                        return !1
                } catch (d) {
                    return !1
                }
                for (var b in a)
                    ;
                return b === n || na.call(a, b)
            },
            isEmptyObject: function(a) {
                for (var b in a)
                    return !1;
                return !0
            },
            error: function(a) {
                throw Error(a);
            },
            parseHTML: function(a, b, d) {
                if (!a || "string" !== typeof a)
                    return null;
                "boolean" === typeof b && (d = b,
                    b = !1);
                b = b || q;
                var e = wb.exec(a);
                d = !d && [];
                if (e)
                    return [b.createElement(e[1])];
                e = c.buildFragment([a], b, d);
                d && c(d).remove();
                return c.merge([], e.childNodes)
            },
            parseJSON: function(a) {
                if (r.JSON && r.JSON.parse)
                    return r.JSON.parse(a);
                if (null === a)
                    return a;
                if ("string" === typeof a && (a = c.trim(a)) && jc.test(a.replace(lc, "@").replace(mc, "]").replace(kc, "")))
                    return (new Function("return " + a))();
                c.error("Invalid JSON: " + a)
            },
            parseXML: function(a) {
                if (!a || "string" !== typeof a)
                    return null;
                try {
                    if (r.DOMParser) {
                        var b = new DOMParser;
                        var d = b.parseFromString(a, "text/xml")
                    } else
                        d = new ActiveXObject("Microsoft.XMLDOM"),
                            d.async = "false",
                            d.loadXML(a)
                } catch (e) {
                    d = n
                }
                d && d.documentElement && !d.getElementsByTagName("parsererror").length || c.error("Invalid XML: " + a);
                return d
            },
            noop: function() {},
            globalEval: function(a) {
                a && c.trim(a) && (r.execScript || function(a) {
                        r.eval.call(r, a)
                    }
                )(a)
            },
            camelCase: function(a) {
                return a.replace(nc, "ms-").replace(oc, pc)
            },
            nodeName: function(a, b) {
                return a.nodeName && a.nodeName.toLowerCase() === b.toLowerCase()
            },
            each: function(a, b, c) {
                var d = 0
                    , f = a.length;
                var g = Ba(a);
                if (c)
                    if (g)
                        for (; d < f && (g = b.apply(a[d], c),
                        !1 !== g); d++)
                            ;
                    else
                        for (d in a) {
                            if (g = b.apply(a[d], c),
                            !1 === g)
                                break
                        }
                else if (g)
                    for (; d < f && (g = b.call(a[d], d, a[d]),
                    !1 !== g); d++)
                        ;
                else
                    for (d in a)
                        if (g = b.call(a[d], d, a[d]),
                        !1 === g)
                            break;
                return a
            },
            trim: Ja && !Ja.call("\ufeff\u00a0") ? function(a) {
                    return null == a ? "" : Ja.call(a)
                }
                : function(a) {
                    return null == a ? "" : (a + "").replace(hc, "")
                }
            ,
            makeArray: function(a, b) {
                b = b || [];
                null != a && (Ba(Object(a)) ? c.merge(b, "string" === typeof a ? [a] : a) : Ia.call(b, a));
                return b
            },
            inArray: function(a, b, c) {
                if (b) {
                    if (vb)
                        return vb.call(b, a, c);
                    var d = b.length;
                    for (c = c ? 0 > c ? Math.max(0, d + c) : c : 0; c < d; c++)
                        if (c in b && b[c] === a)
                            return c
                }
                return -1
            },
            merge: function(a, b) {
                var c = b.length
                    , e = a.length
                    , f = 0;
                if ("number" === typeof c)
                    for (; f < c; f++)
                        a[e++] = b[f];
                else
                    for (; b[f] !== n; )
                        a[e++] = b[f++];
                a.length = e;
                return a
            },
            grep: function(a, b, c) {
                var d = []
                    , f = 0
                    , g = a.length;
                for (c = !!c; f < g; f++) {
                    var h = !!b(a[f], f);
                    c !== h && d.push(a[f])
                }
                return d
            },
            map: function(a, b, c) {
                var d = 0
                    , f = a.length
                    , g = [];
                if (Ba(a))
                    for (; d < f; d++) {
                        var h = b(a[d], d, c);
                        null != h && (g[g.length] = h)
                    }
                else
                    for (d in a)
                        h = b(a[d], d, c),
                        null != h && (g[g.length] = h);
                return ub.apply([], g)
            },
            guid: 1,
            proxy: function(a, b) {
                if ("string" === typeof b) {
                    var d = a[b];
                    b = a;
                    a = d
                }
                if (!c.isFunction(a))
                    return n;
                var e = O.call(arguments, 2);
                d = function() {
                    return a.apply(b || this, e.concat(O.call(arguments)))
                }
                ;
                d.guid = a.guid = a.guid || c.guid++;
                return d
            },
            access: function(a, b, d, e, f, g, h) {
                var k = 0
                    , l = a.length
                    , m = null == d;
                if ("object" === c.type(d))
                    for (k in f = !0,
                        d)
                        c.access(a, b, k, d[k], !0, g, h);
                else if (e !== n && (f = !0,
                c.isFunction(e) || (h = !0),
                m && (h ? (b.call(a, e),
                    b = null) : (m = b,
                        b = function(a, b, d) {
                            return m.call(c(a), d)
                        }
                )),
                    b))
                    for (; k < l; k++)
                        b(a[k], d, h ? e : e.call(a[k], k, b(a[k], d)));
                return f ? a : m ? b.call(a) : l ? b(a[0], d) : g
            },
            now: function() {
                return (new Date).getTime()
            }
        });
        c.ready.promise = function(a) {
            if (!ha)
                if (ha = c.Deferred(),
                "complete" === q.readyState)
                    setTimeout(c.ready);
                else if (q.addEventListener)
                    q.addEventListener("DOMContentLoaded", F, !1),
                        r.addEventListener("load", F, !1);
                else {
                    q.attachEvent("onreadystatechange", F);
                    r.attachEvent("onload", F);
                    var b = !1;
                    try {
                        b = null == r.frameElement && q.documentElement
                    } catch (d) {}
                    b && b.doScroll && function e() {
                        if (!c.isReady) {
                            try {
                                b.doScroll("left")
                            } catch (f) {
                                return setTimeout(e, 50)
                            }
                            xb();
                            c.ready()
                        }
                    }()
                }
            return ha.promise(a)
        }
        ;
        c.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(a, b) {
            ma["[object " + b + "]"] = b.toLowerCase()
        });
        var gc = c(q);
        var Va = {};
        c.Callbacks = function(a) {
            a = "string" === typeof a ? Va[a] || Sb(a) : c.extend({}, a);
            var b, d, e, f, g, h, k = [], l = !a.once && [], m = function(c) {
                d = a.memory && c;
                e = !0;
                g = h || 0;
                h = 0;
                f = k.length;
                for (b = !0; k && g < f; g++)
                    if (!1 === k[g].apply(c[0], c[1]) && a.stopOnFalse) {
                        d = !1;
                        break
                    }
                b = !1;
                k && (l ? l.length && m(l.shift()) : d ? k = [] : t.disable())
            }, t = {
                add: function() {
                    if (k) {
                        var e = k.length;
                        (function qc(b) {
                                c.each(b, function(b, d) {
                                    b = c.type(d);
                                    "function" === b ? a.unique && t.has(d) || k.push(d) : d && d.length && "string" !== b && qc(d)
                                })
                            }
                        )(arguments);
                        b ? f = k.length : d && (h = e,
                            m(d))
                    }
                    return this
                },
                remove: function() {
                    k && c.each(arguments, function(a, d) {
                        for (var e; -1 < (e = c.inArray(d, k, e)); )
                            k.splice(e, 1),
                            b && (e <= f && f--,
                            e <= g && g--)
                    });
                    return this
                },
                has: function(a) {
                    return a ? -1 < c.inArray(a, k) : !(!k || !k.length)
                },
                empty: function() {
                    k = [];
                    return this
                },
                disable: function() {
                    k = l = d = n;
                    return this
                },
                disabled: function() {
                    return !k
                },
                lock: function() {
                    l = n;
                    d || t.disable();
                    return this
                },
                locked: function() {
                    return !l
                },
                fireWith: function(a, c) {
                    c = c || [];
                    c = [a, c.slice ? c.slice() : c];
                    !k || e && !l || (b ? l.push(c) : m(c));
                    return this
                },
                fire: function() {
                    t.fireWith(this, arguments);
                    return this
                },
                fired: function() {
                    return !!e
                }
            };
            return t
        }
        ;
        c.extend({
            Deferred: function(a) {
                var b = [["resolve", "done", c.Callbacks("once memory"), "resolved"], ["reject", "fail", c.Callbacks("once memory"), "rejected"], ["notify", "progress", c.Callbacks("memory")]]
                    , d = "pending"
                    , e = {
                    state: function() {
                        return d
                    },
                    always: function() {
                        f.done(arguments).fail(arguments);
                        return this
                    },
                    then: function() {
                        var a = arguments;
                        return c.Deferred(function(d) {
                            c.each(b, function(b, g) {
                                var h = g[0]
                                    , k = c.isFunction(a[b]) && a[b];
                                f[g[1]](function() {
                                    var a = k && k.apply(this, arguments);
                                    if (a && c.isFunction(a.promise))
                                        a.promise().done(d.resolve).fail(d.reject).progress(d.notify);
                                    else
                                        d[h + "With"](this === e ? d.promise() : this, k ? [a] : arguments)
                                })
                            });
                            a = null
                        }).promise()
                    },
                    promise: function(a) {
                        return null != a ? c.extend(a, e) : e
                    }
                }
                    , f = {};
                e.pipe = e.then;
                c.each(b, function(a, c) {
                    var g = c[2]
                        , h = c[3];
                    e[c[1]] = g.add;
                    h && g.add(function() {
                        d = h
                    }, b[a ^ 1][2].disable, b[2][2].lock);
                    f[c[0]] = function() {
                        f[c[0] + "With"](this === f ? e : this, arguments);
                        return this
                    }
                    ;
                    f[c[0] + "With"] = g.fireWith
                });
                e.promise(f);
                a && a.call(f, f);
                return f
            },
            when: function(a) {
                var b = 0, d = O.call(arguments), e = d.length, f = 1 !== e || a && c.isFunction(a.promise) ? e : 0, g = 1 === f ? a : c.Deferred(), h = function(a, b, c) {
                    return function(d) {
                        b[a] = this;
                        c[a] = 1 < arguments.length ? O.call(arguments) : d;
                        c === l ? g.notifyWith(b, c) : --f || g.resolveWith(b, c)
                    }
                }, k;
                if (1 < e) {
                    var l = Array(e);
                    var m = Array(e);
                    for (k = Array(e); b < e; b++)
                        d[b] && c.isFunction(d[b].promise) ? d[b].promise().done(h(b, k, d)).fail(g.reject).progress(h(b, m, l)) : --f
                }
                f || g.resolveWith(k, d);
                return g.promise()
            }
        });
        c.support = function() {
            var a, b, d = q.createElement("div");
            d.setAttribute("className", "t");
            d.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>";
            var e = d.getElementsByTagName("*");
            var f = d.getElementsByTagName("a")[0];
            if (!e || !f || !e.length)
                return {};
            var g = q.createElement("select");
            var h = g.appendChild(q.createElement("option"));
            e = d.getElementsByTagName("input")[0];
            f.style.cssText = "top:1px;float:left;opacity:.5";
            var k = {
                getSetAttribute: "t" !== d.className,
                leadingWhitespace: 3 === d.firstChild.nodeType,
                tbody: !d.getElementsByTagName("tbody").length,
                htmlSerialize: !!d.getElementsByTagName("link").length,
                style: /top/.test(f.getAttribute("style")),
                hrefNormalized: "/a" === f.getAttribute("href"),
                opacity: /^0.5/.test(f.style.opacity),
                cssFloat: !!f.style.cssFloat,
                checkOn: !!e.value,
                optSelected: h.selected,
                enctype: !!q.createElement("form").enctype,
                html5Clone: "<:nav></:nav>" !== q.createElement("nav").cloneNode(!0).outerHTML,
                boxModel: "CSS1Compat" === q.compatMode,
                deleteExpando: !0,
                noCloneEvent: !0,
                inlineBlockNeedsLayout: !1,
                shrinkWrapBlocks: !1,
                reliableMarginRight: !0,
                boxSizingReliable: !0,
                pixelPosition: !1
            };
            e.checked = !0;
            k.noCloneChecked = e.cloneNode(!0).checked;
            g.disabled = !0;
            k.optDisabled = !h.disabled;
            try {
                delete d.test
            } catch (l) {
                k.deleteExpando = !1
            }
            e = q.createElement("input");
            e.setAttribute("value", "");
            k.input = "" === e.getAttribute("value");
            e.value = "t";
            e.setAttribute("type", "radio");
            k.radioValue = "t" === e.value;
            e.setAttribute("checked", "t");
            e.setAttribute("name", "t");
            f = q.createDocumentFragment();
            f.appendChild(e);
            k.appendChecked = e.checked;
            k.checkClone = f.cloneNode(!0).cloneNode(!0).lastChild.checked;
            d.attachEvent && (d.attachEvent("onclick", function() {
                k.noCloneEvent = !1
            }),
                d.cloneNode(!0).click());
            for (b in {
                submit: !0,
                change: !0,
                focusin: !0
            })
                d.setAttribute(f = "on" + b, "t"),
                    k[b + "Bubbles"] = f in r || !1 === d.attributes[f].expando;
            d.style.backgroundClip = "content-box";
            d.cloneNode(!0).style.backgroundClip = "";
            k.clearCloneStyle = "content-box" === d.style.backgroundClip;
            c(function() {
                var b = q.getElementsByTagName("body")[0];
                if (b) {
                    var c = q.createElement("div");
                    c.style.cssText = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px";
                    b.appendChild(c).appendChild(d);
                    d.innerHTML = "<table><tr><td></td><td>t</td></tr></table>";
                    var e = d.getElementsByTagName("td");
                    e[0].style.cssText = "padding:0;margin:0;border:0;display:none";
                    a = 0 === e[0].offsetHeight;
                    e[0].style.display = "";
                    e[1].style.display = "none";
                    k.reliableHiddenOffsets = a && 0 === e[0].offsetHeight;
                    d.innerHTML = "";
                    d.style.cssText = "box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;";
                    k.boxSizing = 4 === d.offsetWidth;
                    k.doesNotIncludeMarginInBodyOffset = 1 !== b.offsetTop;
                    r.getComputedStyle && (k.pixelPosition = "1%" !== (r.getComputedStyle(d, null) || {}).top,
                        k.boxSizingReliable = "4px" === (r.getComputedStyle(d, null) || {
                            width: "4px"
                        }).width,
                        e = d.appendChild(q.createElement("div")),
                        e.style.cssText = d.style.cssText = "padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;",
                        e.style.marginRight = e.style.width = "0",
                        d.style.width = "1px",
                        k.reliableMarginRight = !parseFloat((r.getComputedStyle(e, null) || {}).marginRight));
                    typeof d.style.zoom !== H && (d.style.cssText = "padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;width:1px;padding:1px;display:inline;zoom:1",
                        k.inlineBlockNeedsLayout = 3 === d.offsetWidth,
                        d.style.display = "block",
                        d.innerHTML = "<div></div>",
                        d.firstChild.style.width = "5px",
                        k.shrinkWrapBlocks = 3 !== d.offsetWidth,
                    k.inlineBlockNeedsLayout && (b.style.zoom = 1));
                    b.removeChild(c);
                    d = null
                }
            });
            e = g = f = h = f = e = null;
            return k
        }();
        var Ub = /(?:\{[\s\S]*\}|\[[\s\S]*\])$/
            , Tb = /([A-Z])/g;
        c.extend({
            cache: {},
            expando: "jQuery" + ("2.0" + Math.random()).replace(/\D/g, ""),
            noData: {
                embed: !0,
                object: "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",
                applet: !0
            },
            hasData: function(a) {
                a = a.nodeType ? c.cache[a[c.expando]] : a[c.expando];
                return !!a && !Ca(a)
            },
            data: function(a, b, c) {
                return Wa(a, b, c)
            },
            removeData: function(a, b) {
                return Xa(a, b)
            },
            _data: function(a, b, c) {
                return Wa(a, b, c, !0)
            },
            _removeData: function(a, b) {
                return Xa(a, b, !0)
            },
            acceptData: function(a) {
                if (a.nodeType && 1 !== a.nodeType && 9 !== a.nodeType)
                    return !1;
                var b = a.nodeName && c.noData[a.nodeName.toLowerCase()];
                return !b || !0 !== b && a.getAttribute("classid") === b
            }
        });
        c.fn.extend({
            data: function(a, b) {
                var d, e = this[0], f = 0, g = null;
                if (a === n) {
                    if (this.length && (g = c.data(e),
                    1 === e.nodeType && !c._data(e, "parsedAttrs"))) {
                        for (d = e.attributes; f < d.length; f++) {
                            var h = d[f].name;
                            h.indexOf("data-") || (h = c.camelCase(h.slice(5)),
                                Ya(e, h, g[h]))
                        }
                        c._data(e, "parsedAttrs", !0)
                    }
                    return g
                }
                return "object" === typeof a ? this.each(function() {
                    c.data(this, a)
                }) : c.access(this, function(b) {
                    if (b === n)
                        return e ? Ya(e, a, c.data(e, a)) : null;
                    this.each(function() {
                        c.data(this, a, b)
                    })
                }, null, b, 1 < arguments.length, null, !0)
            },
            removeData: function(a) {
                return this.each(function() {
                    c.removeData(this, a)
                })
            }
        });
        c.extend({
            queue: function(a, b, d) {
                if (a) {
                    b = (b || "fx") + "queue";
                    var e = c._data(a, b);
                    d && (!e || c.isArray(d) ? e = c._data(a, b, c.makeArray(d)) : e.push(d));
                    return e || []
                }
            },
            dequeue: function(a, b) {
                b = b || "fx";
                var d = c.queue(a, b)
                    , e = d.length
                    , f = d.shift()
                    , g = c._queueHooks(a, b)
                    , h = function() {
                    c.dequeue(a, b)
                };
                "inprogress" === f && (f = d.shift(),
                    e--);
                if (g.cur = f)
                    "fx" === b && d.unshift("inprogress"),
                        delete g.stop,
                        f.call(a, h, g);
                !e && g && g.empty.fire()
            },
            _queueHooks: function(a, b) {
                var d = b + "queueHooks";
                return c._data(a, d) || c._data(a, d, {
                    empty: c.Callbacks("once memory").add(function() {
                        c._removeData(a, b + "queue");
                        c._removeData(a, d)
                    })
                })
            }
        });
        c.fn.extend({
            queue: function(a, b) {
                var d = 2;
                "string" !== typeof a && (b = a,
                    a = "fx",
                    d--);
                return arguments.length < d ? c.queue(this[0], a) : b === n ? this : this.each(function() {
                    var d = c.queue(this, a, b);
                    c._queueHooks(this, a);
                    "fx" === a && "inprogress" !== d[0] && c.dequeue(this, a)
                })
            },
            dequeue: function(a) {
                return this.each(function() {
                    c.dequeue(this, a)
                })
            },
            delay: function(a, b) {
                a = c.fx ? c.fx.speeds[a] || a : a;
                return this.queue(b || "fx", function(b, c) {
                    var d = setTimeout(b, a);
                    c.stop = function() {
                        clearTimeout(d)
                    }
                })
            },
            clearQueue: function(a) {
                return this.queue(a || "fx", [])
            },
            promise: function(a, b) {
                var d, e = 1, f = c.Deferred(), g = this, h = this.length, k = function() {
                    --e || f.resolveWith(g, [g])
                };
                "string" !== typeof a && (b = a,
                    a = n);
                for (a = a || "fx"; h--; )
                    (d = c._data(g[h], a + "queueHooks")) && d.empty && (e++,
                        d.empty.add(k));
                k();
                return f.promise(b)
            }
        });
        var Ka = /[\t\r\n]/g
            , rc = /\r/g
            , sc = /^(?:input|select|textarea|button|object)$/i
            , tc = /^(?:a|area)$/i
            , zb = /^(?:checked|selected|autofocus|autoplay|async|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped)$/i
            , La = /^(?:checked|selected)$/i
            , P = c.support.getSetAttribute
            , Ma = c.support.input;
        c.fn.extend({
            attr: function(a, b) {
                return c.access(this, c.attr, a, b, 1 < arguments.length)
            },
            removeAttr: function(a) {
                return this.each(function() {
                    c.removeAttr(this, a)
                })
            },
            prop: function(a, b) {
                return c.access(this, c.prop, a, b, 1 < arguments.length)
            },
            removeProp: function(a) {
                a = c.propFix[a] || a;
                return this.each(function() {
                    try {
                        this[a] = n,
                            delete this[a]
                    } catch (b) {}
                })
            },
            addClass: function(a) {
                var b, d, e, f = 0, g = this.length;
                var h = "string" === typeof a && a;
                if (c.isFunction(a))
                    return this.each(function(b) {
                        c(this).addClass(a.call(this, b, this.className))
                    });
                if (h)
                    for (h = (a || "").match(R) || []; f < g; f++) {
                        var k = this[f];
                        if (b = 1 === k.nodeType && (k.className ? (" " + k.className + " ").replace(Ka, " ") : " ")) {
                            for (e = 0; d = h[e++]; )
                                0 > b.indexOf(" " + d + " ") && (b += d + " ");
                            k.className = c.trim(b)
                        }
                    }
                return this
            },
            removeClass: function(a) {
                var b, d, e, f = 0, g = this.length;
                var h = 0 === arguments.length || "string" === typeof a && a;
                if (c.isFunction(a))
                    return this.each(function(b) {
                        c(this).removeClass(a.call(this, b, this.className))
                    });
                if (h)
                    for (h = (a || "").match(R) || []; f < g; f++) {
                        var k = this[f];
                        if (b = 1 === k.nodeType && (k.className ? (" " + k.className + " ").replace(Ka, " ") : "")) {
                            for (e = 0; d = h[e++]; )
                                for (; 0 <= b.indexOf(" " + d + " "); )
                                    b = b.replace(" " + d + " ", " ");
                            k.className = a ? c.trim(b) : ""
                        }
                    }
                return this
            },
            toggleClass: function(a, b) {
                var d = typeof a
                    , e = "boolean" === typeof b;
                return c.isFunction(a) ? this.each(function(d) {
                    c(this).toggleClass(a.call(this, d, this.className, b), b)
                }) : this.each(function() {
                    if ("string" === d)
                        for (var f, g = 0, h = c(this), k = b, l = a.match(R) || []; f = l[g++]; )
                            k = e ? k : !h.hasClass(f),
                                h[k ? "addClass" : "removeClass"](f);
                    else if (d === H || "boolean" === d)
                        this.className && c._data(this, "__className__", this.className),
                            this.className = this.className || !1 === a ? "" : c._data(this, "__className__") || ""
                })
            },
            hasClass: function(a) {
                a = " " + a + " ";
                for (var b = 0, c = this.length; b < c; b++)
                    if (1 === this[b].nodeType && 0 <= (" " + this[b].className + " ").replace(Ka, " ").indexOf(a))
                        return !0;
                return !1
            },
            val: function(a) {
                var b, d, e = this[0];
                if (arguments.length) {
                    var f = c.isFunction(a);
                    return this.each(function(b) {
                        var e = c(this);
                        1 === this.nodeType && (b = f ? a.call(this, b, e.val()) : a,
                            null == b ? b = "" : "number" === typeof b ? b += "" : c.isArray(b) && (b = c.map(b, function(a) {
                                return null == a ? "" : a + ""
                            })),
                            d = c.valHooks[this.type] || c.valHooks[this.nodeName.toLowerCase()],
                        d && "set"in d && d.set(this, b, "value") !== n || (this.value = b))
                    })
                }
                if (e) {
                    if ((d = c.valHooks[e.type] || c.valHooks[e.nodeName.toLowerCase()]) && "get"in d && (b = d.get(e, "value")) !== n)
                        return b;
                    b = e.value;
                    return "string" === typeof b ? b.replace(rc, "") : null == b ? "" : b
                }
            }
        });
        c.extend({
            valHooks: {
                option: {
                    get: function(a) {
                        var b = a.attributes.value;
                        return !b || b.specified ? a.value : a.text
                    }
                },
                select: {
                    get: function(a) {
                        for (var b, d = a.options, e = a.selectedIndex, f = (a = "select-one" === a.type || 0 > e) ? null : [], g = a ? e + 1 : d.length, h = 0 > e ? g : a ? e : 0; h < g; h++)
                            if (b = d[h],
                                !(!b.selected && h !== e || (c.support.optDisabled ? b.disabled : null !== b.getAttribute("disabled")) || b.parentNode.disabled && c.nodeName(b.parentNode, "optgroup"))) {
                                b = c(b).val();
                                if (a)
                                    return b;
                                f.push(b)
                            }
                        return f
                    },
                    set: function(a, b) {
                        var d = c.makeArray(b);
                        c(a).find("option").each(function() {
                            this.selected = 0 <= c.inArray(c(this).val(), d)
                        });
                        d.length || (a.selectedIndex = -1);
                        return d
                    }
                }
            },
            attr: function(a, b, d) {
                var e;
                var f = a.nodeType;
                if (a && 3 !== f && 8 !== f && 2 !== f) {
                    if (typeof a.getAttribute === H)
                        return c.prop(a, b, d);
                    if (f = 1 !== f || !c.isXMLDoc(a)) {
                        b = b.toLowerCase();
                        var g = c.attrHooks[b] || (zb.test(b) ? uc : oa)
                    }
                    if (d !== n)
                        if (null === d)
                            c.removeAttr(a, b);
                        else {
                            if (g && f && "set"in g && (e = g.set(a, d, b)) !== n)
                                return e;
                            a.setAttribute(b, d + "");
                            return d
                        }
                    else {
                        if (g && f && "get"in g && null !== (e = g.get(a, b)))
                            return e;
                        typeof a.getAttribute !== H && (e = a.getAttribute(b));
                        return null == e ? n : e
                    }
                }
            },
            removeAttr: function(a, b) {
                var d = 0
                    , e = b && b.match(R);
                if (e && 1 === a.nodeType)
                    for (; b = e[d++]; ) {
                        var f = c.propFix[b] || b;
                        zb.test(b) ? !P && La.test(b) ? a[c.camelCase("default-" + b)] = a[f] = !1 : a[f] = !1 : c.attr(a, b, "");
                        a.removeAttribute(P ? b : f)
                    }
            },
            attrHooks: {
                type: {
                    set: function(a, b) {
                        if (!c.support.radioValue && "radio" === b && c.nodeName(a, "input")) {
                            var d = a.value;
                            a.setAttribute("type", b);
                            d && (a.value = d);
                            return b
                        }
                    }
                }
            },
            propFix: {
                tabindex: "tabIndex",
                readonly: "readOnly",
                "for": "htmlFor",
                "class": "className",
                maxlength: "maxLength",
                cellspacing: "cellSpacing",
                cellpadding: "cellPadding",
                rowspan: "rowSpan",
                colspan: "colSpan",
                usemap: "useMap",
                frameborder: "frameBorder",
                contenteditable: "contentEditable"
            },
            prop: function(a, b, d) {
                var e, f = a.nodeType;
                if (a && 3 !== f && 8 !== f && 2 !== f) {
                    if (1 !== f || !c.isXMLDoc(a)) {
                        b = c.propFix[b] || b;
                        var g = c.propHooks[b]
                    }
                    return d !== n ? g && "set"in g && (e = g.set(a, d, b)) !== n ? e : a[b] = d : g && "get"in g && null !== (e = g.get(a, b)) ? e : a[b]
                }
            },
            propHooks: {
                tabIndex: {
                    get: function(a) {
                        var b = a.getAttributeNode("tabindex");
                        return b && b.specified ? parseInt(b.value, 10) : sc.test(a.nodeName) || tc.test(a.nodeName) && a.href ? 0 : n
                    }
                }
            }
        });
        var uc = {
            get: function(a, b) {
                var d = c.prop(a, b)
                    , e = "boolean" === typeof d && a.getAttribute(b);
                return (a = "boolean" === typeof d ? Ma && P ? null != e : La.test(b) ? a[c.camelCase("default-" + b)] : !!e : a.getAttributeNode(b)) && !1 !== a.value ? b.toLowerCase() : n
            },
            set: function(a, b, d) {
                !1 === b ? c.removeAttr(a, d) : Ma && P || !La.test(d) ? a.setAttribute(!P && c.propFix[d] || d, d) : a[c.camelCase("default-" + d)] = a[d] = !0;
                return d
            }
        };
        Ma && P || (c.attrHooks.value = {
            get: function(a, b) {
                b = a.getAttributeNode(b);
                return c.nodeName(a, "input") ? a.defaultValue : b && b.specified ? b.value : n
            },
            set: function(a, b, d) {
                if (c.nodeName(a, "input"))
                    a.defaultValue = b;
                else
                    return oa && oa.set(a, b, d)
            }
        });
        if (!P) {
            var oa = c.valHooks.button = {
                get: function(a, b) {
                    return (a = a.getAttributeNode(b)) && ("id" === b || "name" === b || "coords" === b ? "" !== a.value : a.specified) ? a.value : n
                },
                set: function(a, b, c) {
                    var d = a.getAttributeNode(c);
                    d || a.setAttributeNode(d = a.ownerDocument.createAttribute(c));
                    d.value = b += "";
                    return "value" === c || b === a.getAttribute(c) ? b : n
                }
            };
            c.attrHooks.contenteditable = {
                get: oa.get,
                set: function(a, b, c) {
                    oa.set(a, "" === b ? !1 : b, c)
                }
            };
            c.each(["width", "height"], function(a, b) {
                c.attrHooks[b] = c.extend(c.attrHooks[b], {
                    set: function(a, c) {
                        if ("" === c)
                            return a.setAttribute(b, "auto"),
                                c
                    }
                })
            })
        }
        c.support.hrefNormalized || (c.each(["href", "src", "width", "height"], function(a, b) {
            c.attrHooks[b] = c.extend(c.attrHooks[b], {
                get: function(a) {
                    a = a.getAttribute(b, 2);
                    return null == a ? n : a
                }
            })
        }),
            c.each(["href", "src"], function(a, b) {
                c.propHooks[b] = {
                    get: function(a) {
                        return a.getAttribute(b, 4)
                    }
                }
            }));
        c.support.style || (c.attrHooks.style = {
            get: function(a) {
                return a.style.cssText || n
            },
            set: function(a, b) {
                return a.style.cssText = b + ""
            }
        });
        c.support.optSelected || (c.propHooks.selected = c.extend(c.propHooks.selected, {
            get: function(a) {
                if (a = a.parentNode)
                    a.selectedIndex,
                    a.parentNode && a.parentNode.selectedIndex;
                return null
            }
        }));
        c.support.enctype || (c.propFix.enctype = "encoding");
        c.support.checkOn || c.each(["radio", "checkbox"], function() {
            c.valHooks[this] = {
                get: function(a) {
                    return null === a.getAttribute("value") ? "on" : a.value
                }
            }
        });
        c.each(["radio", "checkbox"], function() {
            c.valHooks[this] = c.extend(c.valHooks[this], {
                set: function(a, b) {
                    if (c.isArray(b))
                        return a.checked = 0 <= c.inArray(c(a).val(), b)
                }
            })
        });
        var Na = /^(?:input|select|textarea)$/i
            , vc = /^key/
            , wc = /^(?:mouse|contextmenu)|click/
            , Ab = /^(?:focusinfocus|focusoutblur)$/
            , Bb = /^([^.]*)(?:\.(.+)|)$/;
        c.event = {
            global: {},
            add: function(a, b, d, e, f) {
                var g, h, k, l, m;
                if (h = c._data(a)) {
                    if (d.handler) {
                        var t = d;
                        d = t.handler;
                        f = t.selector
                    }
                    d.guid || (d.guid = c.guid++);
                    (g = h.events) || (g = h.events = {});
                    (k = h.handle) || (k = h.handle = function(a) {
                        return typeof c === H || a && c.event.triggered === a.type ? n : c.event.dispatch.apply(k.elem, arguments)
                    }
                        ,
                        k.elem = a);
                    b = (b || "").match(R) || [""];
                    for (h = b.length; h--; ) {
                        var p = Bb.exec(b[h]) || [];
                        var u = l = p[1];
                        var q = (p[2] || "").split(".").sort();
                        p = c.event.special[u] || {};
                        u = (f ? p.delegateType : p.bindType) || u;
                        p = c.event.special[u] || {};
                        l = c.extend({
                            type: u,
                            origType: l,
                            data: e,
                            handler: d,
                            guid: d.guid,
                            selector: f,
                            needsContext: f && c.expr.match.needsContext.test(f),
                            namespace: q.join(".")
                        }, t);
                        (m = g[u]) || (m = g[u] = [],
                            m.delegateCount = 0,
                        p.setup && !1 !== p.setup.call(a, e, q, k) || (a.addEventListener ? a.addEventListener(u, k, !1) : a.attachEvent && a.attachEvent("on" + u, k)));
                        p.add && (p.add.call(a, l),
                        l.handler.guid || (l.handler.guid = d.guid));
                        f ? m.splice(m.delegateCount++, 0, l) : m.push(l);
                        c.event.global[u] = !0
                    }
                    a = null
                }
            },
            remove: function(a, b, d, e, f) {
                var g, h, k, l, m, n = c.hasData(a) && c._data(a);
                if (n && (l = n.events)) {
                    b = (b || "").match(R) || [""];
                    for (k = b.length; k--; ) {
                        var p = Bb.exec(b[k]) || [];
                        var u = m = p[1];
                        var q = (p[2] || "").split(".").sort();
                        if (u) {
                            var r = c.event.special[u] || {};
                            u = (e ? r.delegateType : r.bindType) || u;
                            var x = l[u] || [];
                            p = p[2] && new RegExp("(^|\\.)" + q.join("\\.(?:.*\\.|)") + "(\\.|$)");
                            for (h = g = x.length; g--; ) {
                                var D = x[g];
                                !f && m !== D.origType || d && d.guid !== D.guid || p && !p.test(D.namespace) || e && e !== D.selector && ("**" !== e || !D.selector) || (x.splice(g, 1),
                                D.selector && x.delegateCount--,
                                r.remove && r.remove.call(a, D))
                            }
                            h && !x.length && (r.teardown && !1 !== r.teardown.call(a, q, n.handle) || c.removeEvent(a, u, n.handle),
                                delete l[u])
                        } else
                            for (u in l)
                                c.event.remove(a, u + b[k], d, e, !0)
                    }
                    c.isEmptyObject(l) && (delete n.handle,
                        c._removeData(a, "events"))
                }
            },
            trigger: function(a, b, d, e) {
                var f, g, h = [d || q], k = na.call(a, "type") ? a.type : a;
                var l = na.call(a, "namespace") ? a.namespace.split(".") : [];
                var m = f = d = d || q;
                if (3 !== d.nodeType && 8 !== d.nodeType && !Ab.test(k + c.event.triggered)) {
                    0 <= k.indexOf(".") && (l = k.split("."),
                        k = l.shift(),
                        l.sort());
                    var t = 0 > k.indexOf(":") && "on" + k;
                    a = a[c.expando] ? a : new c.Event(k,"object" === typeof a && a);
                    a.isTrigger = !0;
                    a.namespace = l.join(".");
                    a.namespace_re = a.namespace ? new RegExp("(^|\\.)" + l.join("\\.(?:.*\\.|)") + "(\\.|$)") : null;
                    a.result = n;
                    a.target || (a.target = d);
                    b = null == b ? [a] : c.makeArray(b, [a]);
                    l = c.event.special[k] || {};
                    if (e || !l.trigger || !1 !== l.trigger.apply(d, b)) {
                        if (!e && !l.noBubble && !c.isWindow(d)) {
                            var p = l.delegateType || k;
                            Ab.test(p + k) || (m = m.parentNode);
                            for (; m; m = m.parentNode)
                                h.push(m),
                                    f = m;
                            f === (d.ownerDocument || q) && h.push(f.defaultView || f.parentWindow || r)
                        }
                        for (g = 0; (m = h[g++]) && !a.isPropagationStopped(); )
                            a.type = 1 < g ? p : l.bindType || k,
                            (f = (c._data(m, "events") || {})[a.type] && c._data(m, "handle")) && f.apply(m, b),
                            (f = t && m[t]) && c.acceptData(m) && f.apply && !1 === f.apply(m, b) && a.preventDefault();
                        a.type = k;
                        if (!(e || a.isDefaultPrevented() || l._default && !1 !== l._default.apply(d.ownerDocument, b) || "click" === k && c.nodeName(d, "a")) && c.acceptData(d) && t && d[k] && !c.isWindow(d)) {
                            (f = d[t]) && (d[t] = null);
                            c.event.triggered = k;
                            try {
                                d[k]()
                            } catch (u) {}
                            c.event.triggered = n;
                            f && (d[t] = f)
                        }
                        return a.result
                    }
                }
            },
            dispatch: function(a) {
                a = c.event.fix(a);
                var b, d, e, f = O.call(arguments);
                var g = (c._data(this, "events") || {})[a.type] || [];
                var h = c.event.special[a.type] || {};
                f[0] = a;
                a.delegateTarget = this;
                if (!h.preDispatch || !1 !== h.preDispatch.call(this, a)) {
                    var k = c.event.handlers.call(this, a, g);
                    for (g = 0; (d = k[g++]) && !a.isPropagationStopped(); )
                        for (a.currentTarget = d.elem,
                                 e = 0; (b = d.handlers[e++]) && !a.isImmediatePropagationStopped(); )
                            if (!a.namespace_re || a.namespace_re.test(b.namespace))
                                a.handleObj = b,
                                    a.data = b.data,
                                    b = ((c.event.special[b.origType] || {}).handle || b.handler).apply(d.elem, f),
                                b !== n && !1 === (a.result = b) && (a.preventDefault(),
                                    a.stopPropagation());
                    h.postDispatch && h.postDispatch.call(this, a);
                    return a.result
                }
            },
            handlers: function(a, b) {
                var d, e = [], f = b.delegateCount, g = a.target;
                if (f && g.nodeType && (!a.button || "click" !== a.type))
                    for (; g != this; g = g.parentNode || this)
                        if (1 === g.nodeType && (!0 !== g.disabled || "click" !== a.type)) {
                            var h = [];
                            for (d = 0; d < f; d++) {
                                var k = b[d];
                                var l = k.selector + " ";
                                h[l] === n && (h[l] = k.needsContext ? 0 <= c(l, this).index(g) : c.find(l, this, null, [g]).length);
                                h[l] && h.push(k)
                            }
                            h.length && e.push({
                                elem: g,
                                handlers: h
                            })
                        }
                f < b.length && e.push({
                    elem: this,
                    handlers: b.slice(f)
                });
                return e
            },
            fix: function(a) {
                if (a[c.expando])
                    return a;
                var b = a.type;
                var d = a
                    , e = this.fixHooks[b];
                e || (this.fixHooks[b] = e = wc.test(b) ? this.mouseHooks : vc.test(b) ? this.keyHooks : {});
                var f = e.props ? this.props.concat(e.props) : this.props;
                a = new c.Event(d);
                for (b = f.length; b--; ) {
                    var g = f[b];
                    a[g] = d[g]
                }
                a.target || (a.target = d.srcElement || q);
                3 === a.target.nodeType && (a.target = a.target.parentNode);
                a.metaKey = !!a.metaKey;
                return e.filter ? e.filter(a, d) : a
            },
            props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
            fixHooks: {},
            keyHooks: {
                props: ["char", "charCode", "key", "keyCode"],
                filter: function(a, b) {
                    null == a.which && (a.which = null != b.charCode ? b.charCode : b.keyCode);
                    return a
                }
            },
            mouseHooks: {
                props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
                filter: function(a, b) {
                    var c = b.button
                        , e = b.fromElement;
                    if (null == a.pageX && null != b.clientX) {
                        var f = a.target.ownerDocument || q;
                        var g = f.documentElement;
                        f = f.body;
                        a.pageX = b.clientX + (g && g.scrollLeft || f && f.scrollLeft || 0) - (g && g.clientLeft || f && f.clientLeft || 0);
                        a.pageY = b.clientY + (g && g.scrollTop || f && f.scrollTop || 0) - (g && g.clientTop || f && f.clientTop || 0)
                    }
                    !a.relatedTarget && e && (a.relatedTarget = e === a.target ? b.toElement : e);
                    a.which || c === n || (a.which = c & 1 ? 1 : c & 2 ? 3 : c & 4 ? 2 : 0);
                    return a
                }
            },
            special: {
                load: {
                    noBubble: !0
                },
                click: {
                    trigger: function() {
                        if (c.nodeName(this, "input") && "checkbox" === this.type && this.click)
                            return this.click(),
                                !1
                    }
                },
                focus: {
                    trigger: function() {
                        if (this !== q.activeElement && this.focus)
                            try {
                                return this.focus(),
                                    !1
                            } catch (a) {}
                    },
                    delegateType: "focusin"
                },
                blur: {
                    trigger: function() {
                        if (this === q.activeElement && this.blur)
                            return this.blur(),
                                !1
                    },
                    delegateType: "focusout"
                },
                beforeunload: {
                    postDispatch: function(a) {
                        a.result !== n && (a.originalEvent.returnValue = a.result)
                    }
                }
            },
            simulate: function(a, b, d, e) {
                a = c.extend(new c.Event, d, {
                    type: a,
                    isSimulated: !0,
                    originalEvent: {}
                });
                e ? c.event.trigger(a, null, b) : c.event.dispatch.call(b, a);
                a.isDefaultPrevented() && d.preventDefault()
            }
        };
        c.removeEvent = q.removeEventListener ? function(a, b, c) {
                a.removeEventListener && a.removeEventListener(b, c, !1)
            }
            : function(a, b, c) {
                b = "on" + b;
                a.detachEvent && (typeof a[b] === H && (a[b] = null),
                    a.detachEvent(b, c))
            }
        ;
        c.Event = function(a, b) {
            if (!(this instanceof c.Event))
                return new c.Event(a,b);
            a && a.type ? (this.originalEvent = a,
                this.type = a.type,
                this.isDefaultPrevented = a.defaultPrevented || !1 === a.returnValue || a.getPreventDefault && a.getPreventDefault() ? qa : W) : this.type = a;
            b && c.extend(this, b);
            this.timeStamp = a && a.timeStamp || c.now();
            this[c.expando] = !0
        }
        ;
        c.Event.prototype = {
            isDefaultPrevented: W,
            isPropagationStopped: W,
            isImmediatePropagationStopped: W,
            preventDefault: function() {
                var a = this.originalEvent;
                this.isDefaultPrevented = qa;
                a && (a.preventDefault ? a.preventDefault() : a.returnValue = !1)
            },
            stopPropagation: function() {
                var a = this.originalEvent;
                this.isPropagationStopped = qa;
                a && (a.stopPropagation && a.stopPropagation(),
                    a.cancelBubble = !0)
            },
            stopImmediatePropagation: function() {
                this.isImmediatePropagationStopped = qa;
                this.stopPropagation()
            }
        };
        c.each({
            mouseenter: "mouseover",
            mouseleave: "mouseout"
        }, function(a, b) {
            c.event.special[a] = {
                delegateType: b,
                bindType: b,
                handle: function(a) {
                    var d = a.relatedTarget
                        , f = a.handleObj;
                    if (!d || d !== this && !c.contains(this, d)) {
                        a.type = f.origType;
                        var g = f.handler.apply(this, arguments);
                        a.type = b
                    }
                    return g
                }
            }
        });
        c.support.submitBubbles || (c.event.special.submit = {
            setup: function() {
                if (c.nodeName(this, "form"))
                    return !1;
                c.event.add(this, "click._submit keypress._submit", function(a) {
                    a = a.target;
                    (a = c.nodeName(a, "input") || c.nodeName(a, "button") ? a.form : n) && !c._data(a, "submitBubbles") && (c.event.add(a, "submit._submit", function(a) {
                        a._submit_bubble = !0
                    }),
                        c._data(a, "submitBubbles", !0))
                })
            },
            postDispatch: function(a) {
                a._submit_bubble && (delete a._submit_bubble,
                this.parentNode && !a.isTrigger && c.event.simulate("submit", this.parentNode, a, !0))
            },
            teardown: function() {
                if (c.nodeName(this, "form"))
                    return !1;
                c.event.remove(this, "._submit")
            }
        });
        c.support.changeBubbles || (c.event.special.change = {
            setup: function() {
                if (Na.test(this.nodeName)) {
                    if ("checkbox" === this.type || "radio" === this.type)
                        c.event.add(this, "propertychange._change", function(a) {
                            "checked" === a.originalEvent.propertyName && (this._just_changed = !0)
                        }),
                            c.event.add(this, "click._change", function(a) {
                                this._just_changed && !a.isTrigger && (this._just_changed = !1);
                                c.event.simulate("change", this, a, !0)
                            });
                    return !1
                }
                c.event.add(this, "beforeactivate._change", function(a) {
                    a = a.target;
                    Na.test(a.nodeName) && !c._data(a, "changeBubbles") && (c.event.add(a, "change._change", function(a) {
                        !this.parentNode || a.isSimulated || a.isTrigger || c.event.simulate("change", this.parentNode, a, !0)
                    }),
                        c._data(a, "changeBubbles", !0))
                })
            },
            handle: function(a) {
                var b = a.target;
                if (this !== b || a.isSimulated || a.isTrigger || "radio" !== b.type && "checkbox" !== b.type)
                    return a.handleObj.handler.apply(this, arguments)
            },
            teardown: function() {
                c.event.remove(this, "._change");
                return !Na.test(this.nodeName)
            }
        });
        c.support.focusinBubbles || c.each({
            focus: "focusin",
            blur: "focusout"
        }, function(a, b) {
            var d = 0
                , e = function(a) {
                c.event.simulate(b, a.target, c.event.fix(a), !0)
            };
            c.event.special[b] = {
                setup: function() {
                    0 === d++ && q.addEventListener(a, e, !0)
                },
                teardown: function() {
                    0 === --d && q.removeEventListener(a, e, !0)
                }
            }
        });
        c.fn.extend({
            on: function(a, b, d, e, f) {
                var g;
                if ("object" === typeof a) {
                    "string" !== typeof b && (d = d || b,
                        b = n);
                    for (g in a)
                        this.on(g, b, d, a[g], f);
                    return this
                }
                null == d && null == e ? (e = b,
                    d = b = n) : null == e && ("string" === typeof b ? (e = d,
                    d = n) : (e = d,
                    d = b,
                    b = n));
                if (!1 === e)
                    e = W;
                else if (!e)
                    return this;
                if (1 === f) {
                    var h = e;
                    e = function(a) {
                        c().off(a);
                        return h.apply(this, arguments)
                    }
                    ;
                    e.guid = h.guid || (h.guid = c.guid++)
                }
                return this.each(function() {
                    c.event.add(this, a, e, d, b)
                })
            },
            one: function(a, b, c, e) {
                return this.on(a, b, c, e, 1)
            },
            off: function(a, b, d) {
                if (a && a.preventDefault && a.handleObj) {
                    var e = a.handleObj;
                    c(a.delegateTarget).off(e.namespace ? e.origType + "." + e.namespace : e.origType, e.selector, e.handler);
                    return this
                }
                if ("object" === typeof a) {
                    for (e in a)
                        this.off(e, b, a[e]);
                    return this
                }
                if (!1 === b || "function" === typeof b)
                    d = b,
                        b = n;
                !1 === d && (d = W);
                return this.each(function() {
                    c.event.remove(this, a, d, b)
                })
            },
            bind: function(a, b, c) {
                return this.on(a, null, b, c)
            },
            unbind: function(a, b) {
                return this.off(a, null, b)
            },
            delegate: function(a, b, c, e) {
                return this.on(b, a, c, e)
            },
            undelegate: function(a, b, c) {
                return 1 === arguments.length ? this.off(a, "**") : this.off(b, a || "**", c)
            },
            trigger: function(a, b) {
                return this.each(function() {
                    c.event.trigger(a, b, this)
                })
            },
            triggerHandler: function(a, b) {
                var d = this[0];
                if (d)
                    return c.event.trigger(a, b, d, !0)
            }
        });
        (function(a, b) {
                function d() {
                    var a, b = [];
                    return a = function(c, d) {
                        b.push(c += " ") > B.cacheLength && delete a[b.shift()];
                        return a[c] = d
                    }
                }
                function e(a) {
                    a[C] = !0;
                    return a
                }
                function f(a) {
                    var b = I.createElement("div");
                    try {
                        return a(b)
                    } catch (v) {
                        return !1
                    } finally {}
                }
                function g(a, b, c, d) {
                    var e, f, g, h;
                    (b ? b.ownerDocument || b : A) !== I && va(b);
                    b = b || I;
                    c = c || [];
                    if (!a || "string" !== typeof a)
                        return c;
                    if (1 !== (h = b.nodeType) && 9 !== h)
                        return [];
                    if (!T && !d) {
                        if (e = na.exec(a))
                            if (g = e[1])
                                if (9 === h)
                                    if ((f = b.getElementById(g)) && f.parentNode) {
                                        if (f.id === g)
                                            return c.push(f),
                                                c
                                    } else
                                        return c;
                                else {
                                    if (b.ownerDocument && (f = b.ownerDocument.getElementById(g)) && wa(b, f) && f.id === g)
                                        return c.push(f),
                                            c
                                }
                            else {
                                if (e[2])
                                    return O.apply(c, P.call(b.getElementsByTagName(a), 0)),
                                        c;
                                if ((g = e[3]) && z.getByClassName && b.getElementsByClassName)
                                    return O.apply(c, P.call(b.getElementsByClassName(g), 0)),
                                        c
                            }
                        if (z.qsa && !Z.test(a)) {
                            e = !0;
                            f = C;
                            g = b;
                            var y = 9 === h && a;
                            if (1 === h && "object" !== b.nodeName.toLowerCase()) {
                                h = n(a);
                                (e = b.getAttribute("id")) ? f = e.replace(ra, "\\$&") : b.setAttribute("id", f);
                                f = "[id='" + f + "'] ";
                                for (g = h.length; g--; )
                                    h[g] = f + p(h[g]);
                                g = ca.test(a) && b.parentNode || b;
                                y = h.join(",")
                            }
                            if (y)
                                try {
                                    return O.apply(c, P.call(g.querySelectorAll(y), 0)),
                                        c
                                } catch (Xc) {} finally {
                                    e || b.removeAttribute("id")
                                }
                        }
                    }
                    var v;
                    a: {
                        a = a.replace(S, "$1");
                        f = n(a);
                        if (!d && 1 === f.length) {
                            e = f[0] = f[0].slice(0);
                            if (2 < e.length && "ID" === (v = e[0]).type && 9 === b.nodeType && !T && B.relative[e[1].type]) {
                                b = B.find.ID(v.matches[0].replace(ia, ja), b)[0];
                                if (!b) {
                                    v = c;
                                    break a
                                }
                                a = a.slice(e.shift().value.length)
                            }
                            for (h = X.needsContext.test(a) ? 0 : e.length; h--; ) {
                                v = e[h];
                                if (B.relative[g = v.type])
                                    break;
                                if (g = B.find[g])
                                    if (d = g(v.matches[0].replace(ia, ja), ca.test(e[0].type) && b.parentNode || b)) {
                                        e.splice(h, 1);
                                        a = d.length && p(e);
                                        if (!a) {
                                            O.apply(c, P.call(d, 0));
                                            v = c;
                                            break a
                                        }
                                        break
                                    }
                            }
                        }
                        ma(a, f)(d, b, T, c, ca.test(a));
                        v = c
                    }
                    return v
                }
                function h(a, b) {
                    var c = b && a
                        , d = c && (~b.sourceIndex || -2147483648) - (~a.sourceIndex || -2147483648);
                    if (d)
                        return d;
                    if (c)
                        for (; c = c.nextSibling; )
                            if (c === b)
                                return -1;
                    return a ? 1 : -1
                }
                function k(a) {
                    return function(b) {
                        return "input" === b.nodeName.toLowerCase() && b.type === a
                    }
                }
                function l(a) {
                    return function(b) {
                        var c = b.nodeName.toLowerCase();
                        return ("input" === c || "button" === c) && b.type === a
                    }
                }
                function m(a) {
                    return e(function(b) {
                        b = +b;
                        return e(function(c, d) {
                            for (var e, f = a([], c.length, b), g = f.length; g--; )
                                c[e = f[g]] && (c[e] = !(d[e] = c[e]))
                        })
                    })
                }
                function n(a, b) {
                    var c, d, e, f, h;
                    if (f = R[a + " "])
                        return b ? 0 : f.slice(0);
                    f = a;
                    var y = [];
                    for (h = B.preFilter; f; ) {
                        if (!k || (c = ea.exec(f)))
                            c && (f = f.slice(c[0].length) || f),
                                y.push(d = []);
                        var k = !1;
                        if (c = fa.exec(f))
                            k = c.shift(),
                                d.push({
                                    value: k,
                                    type: c[0].replace(S, " ")
                                }),
                                f = f.slice(k.length);
                        for (e in B.filter)
                            !(c = X[e].exec(f)) || h[e] && !(c = h[e](c)) || (k = c.shift(),
                                d.push({
                                    value: k,
                                    type: e,
                                    matches: c
                                }),
                                f = f.slice(k.length));
                        if (!k)
                            break
                    }
                    return b ? f.length : f ? g.error(a) : R(a, y).slice(0)
                }
                function p(a) {
                    for (var b = 0, c = a.length, d = ""; b < c; b++)
                        d += a[b].value;
                    return d
                }
                function u(a, b, c) {
                    var d = b.dir
                        , e = c && "parentNode" === d
                        , f = xc++;
                    return b.first ? function(b, c, f) {
                            for (; b = b[d]; )
                                if (1 === b.nodeType || e)
                                    return a(b, c, f)
                        }
                        : function(b, c, g) {
                            var h, k, y = G + " " + f;
                            if (g)
                                for (; b = b[d]; ) {
                                    if ((1 === b.nodeType || e) && a(b, c, g))
                                        return !0
                                }
                            else
                                for (; b = b[d]; )
                                    if (1 === b.nodeType || e) {
                                        var v = b[C] || (b[C] = {});
                                        if ((k = v[d]) && k[0] === y) {
                                            if (!0 === (h = k[1]) || h === L)
                                                return !0 === h
                                        } else if (k = v[d] = [y],
                                            k[1] = a(b, c, g) || L,
                                        !0 === k[1])
                                            return !0
                                    }
                        }
                }
                function q(a) {
                    return 1 < a.length ? function(b, c, d) {
                            for (var e = a.length; e--; )
                                if (!a[e](b, c, d))
                                    return !1;
                            return !0
                        }
                        : a[0]
                }
                function r(a, b, c, d, e) {
                    for (var f, g = [], h = 0, k = a.length, y = null != b; h < k; h++)
                        if (f = a[h])
                            if (!c || c(f, d, e))
                                g.push(f),
                                y && b.push(h);
                    return g
                }
                function D(a, b, c, d, f, h) {
                    d && !d[C] && (d = D(d));
                    f && !f[C] && (f = D(f, h));
                    return e(function(e, h, k, y) {
                        var v, l = [], m = [], Y = h.length, K;
                        if (!(K = e)) {
                            K = b || "*";
                            for (var n = k.nodeType ? [k] : k, p = [], u = 0, q = n.length; u < q; u++)
                                g(K, n[u], p);
                            K = p
                        }
                        K = !a || !e && b ? K : r(K, l, a, k, y);
                        n = c ? f || (e ? a : Y || d) ? [] : h : K;
                        c && c(K, n, k, y);
                        if (d) {
                            var t = r(n, m);
                            d(t, [], k, y);
                            for (k = t.length; k--; )
                                if (v = t[k])
                                    n[m[k]] = !(K[m[k]] = v)
                        }
                        if (e) {
                            if (f || a) {
                                if (f) {
                                    t = [];
                                    for (k = n.length; k--; )
                                        (v = n[k]) && t.push(K[k] = v);
                                    f(null, n = [], t, y)
                                }
                                for (k = n.length; k--; )
                                    (v = n[k]) && -1 < (t = f ? V.call(e, v) : l[k]) && (e[t] = !(h[t] = v))
                            }
                        } else
                            n = r(n === h ? n.splice(Y, n.length) : n),
                                f ? f(null, h, n, y) : O.apply(h, n)
                    })
                }
                function x(a) {
                    var b, c, d = a.length, e = B.relative[a[0].type];
                    var f = e || B.relative[" "];
                    for (var g = e ? 1 : 0, h = u(function(a) {
                        return a === b
                    }, f, !0), k = u(function(a) {
                        return -1 < V.call(b, a)
                    }, f, !0), y = [function(a, c, d) {
                        return !e && (d || c !== pa) || ((b = c).nodeType ? h(a, c, d) : k(a, c, d))
                    }
                    ]; g < d; g++)
                        if (f = B.relative[a[g].type])
                            y = [u(q(y), f)];
                        else {
                            f = B.filter[a[g].type].apply(null, a[g].matches);
                            if (f[C]) {
                                for (c = ++g; c < d && !B.relative[a[c].type]; c++)
                                    ;
                                return D(1 < g && q(y), 1 < g && p(a.slice(0, g - 1)).replace(S, "$1"), f, g < c && x(a.slice(g, c)), c < d && x(a = a.slice(c)), c < d && p(a))
                            }
                            y.push(f)
                        }
                    return q(y)
                }
                function yc(a, b) {
                    var c = 0
                        , d = 0 < b.length
                        , f = 0 < a.length
                        , h = function(e, h, k, y, v) {
                        var l, m, Y = [], K = 0, n = "0", p = e && [], t = null != v, u = pa, q = e || f && B.find.TAG("*", v && h.parentNode || h), Cb = G += null == u ? 1 : Math.random() || .1;
                        t && (pa = h !== I && h,
                            L = c);
                        for (; null != (v = q[n]); n++) {
                            if (f && v) {
                                for (l = 0; m = a[l++]; )
                                    if (m(v, h, k)) {
                                        y.push(v);
                                        break
                                    }
                                t && (G = Cb,
                                    L = ++c)
                            }
                            d && ((v = !m && v) && K--,
                            e && p.push(v))
                        }
                        K += n;
                        if (d && n !== K) {
                            for (l = 0; m = b[l++]; )
                                m(p, Y, h, k);
                            if (e) {
                                if (0 < K)
                                    for (; n--; )
                                        p[n] || Y[n] || (Y[n] = ba.call(y));
                                Y = r(Y)
                            }
                            O.apply(y, Y);
                            t && !e && 0 < Y.length && 1 < K + b.length && g.uniqueSort(y)
                        }
                        t && (G = Cb,
                            pa = u);
                        return p
                    };
                    return d ? e(h) : h
                }
                function E() {}
                var w, L, J, pa, I, Q, T, Z, ua, ya, wa, H, C = "sizzle" + -new Date, A = a.document, z = {}, G = 0, xc = 0, M = d(), R = d(), N = d(), U = typeof b, F = [], ba = F.pop, O = F.push, P = F.slice, V = F.indexOf || function(a) {
                        for (var b = 0, c = this.length; b < c; b++)
                            if (this[b] === a)
                                return b;
                        return -1
                    }
                ;
                F = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+".replace("w", "w#");
                var aa = "\\[[\\x20\\t\\r\\n\\f]*((?:\\\\.|[\\w-]|[^\\x00-\\xa0])+)[\\x20\\t\\r\\n\\f]*(?:([*^$|!~]?=)[\\x20\\t\\r\\n\\f]*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|(" + F + ")|)|)[\\x20\\t\\r\\n\\f]*\\]"
                    , W = ":((?:\\\\.|[\\w-]|[^\\x00-\\xa0])+)(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|" + aa.replace(3, 8) + ")*)|.*)\\)|)"
                    , S = /^[\x20\t\r\n\f]+|((?:^|[^\\])(?:\\.)*)[\x20\t\r\n\f]+$/g
                    , ea = /^[\x20\t\r\n\f]*,[\x20\t\r\n\f]*/
                    , fa = /^[\x20\t\r\n\f]*([\x20\t\r\n\f>+~])[\x20\t\r\n\f]*/
                    , ka = new RegExp(W)
                    , la = new RegExp("^" + F + "$")
                    , X = {
                    ID: /^#((?:\\.|[\w-]|[^\x00-\xa0])+)/,
                    CLASS: /^\.((?:\\.|[\w-]|[^\x00-\xa0])+)/,
                    NAME: /^\[name=['"]?((?:\\.|[\w-]|[^\x00-\xa0])+)['"]?\]/,
                    TAG: new RegExp("^(" + "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+".replace("w", "w*") + ")"),
                    ATTR: new RegExp("^" + aa),
                    PSEUDO: new RegExp("^" + W),
                    CHILD: /^:(only|first|last|nth|nth-last)-(child|of-type)(?:\([\x20\t\r\n\f]*(even|odd|(([+-]|)(\d*)n|)[\x20\t\r\n\f]*(?:([+-]|)[\x20\t\r\n\f]*(\d+)|))[\x20\t\r\n\f]*\)|)/i,
                    needsContext: /^[\x20\t\r\n\f]*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\([\x20\t\r\n\f]*((?:-\d)?\d*)[\x20\t\r\n\f]*\)|)(?=[^-]|$)/i
                }
                    , ca = /[\x20\t\r\n\f]*[+~]/
                    , da = /^[^{]+\{\s*\[native code/
                    , na = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/
                    , oa = /^(?:input|select|textarea|button)$/i
                    , qa = /^h\d$/i
                    , ra = /'|\\/g
                    , sa = /=[\x20\t\r\n\f]*([^'"\]]*)[\x20\t\r\n\f]*\]/g
                    , ia = /\\([\da-fA-F]{1,6}[\x20\t\r\n\f]?|.)/g
                    , ja = function(a, b) {
                    a = "0x" + b - 65536;
                    return a !== a ? b : 0 > a ? String.fromCharCode(a + 65536) : String.fromCharCode(a >> 10 | 55296, a & 1023 | 56320)
                };
                try {
                    P.call(A.documentElement.childNodes, 0)[0].nodeType
                } catch (y) {
                    P = function(a) {
                        for (var b, c = []; b = this[a++]; )
                            c.push(b);
                        return c
                    }
                }
                var ta = g.isXML = function(a) {
                        return (a = a && (a.ownerDocument || a).documentElement) ? "HTML" !== a.nodeName : !1
                    }
                ;
                var va = g.setDocument = function(a) {
                        var c = a ? a.ownerDocument || a : A;
                        if (c === I || 9 !== c.nodeType || !c.documentElement)
                            return I;
                        I = c;
                        Q = c.documentElement;
                        T = ta(c);
                        z.tagNameNoComments = f(function(a) {
                            a.appendChild(c.createComment(""));
                            return !a.getElementsByTagName("*").length
                        });
                        z.attributes = f(function(a) {
                            a.innerHTML = "<select></select>";
                            a = typeof a.lastChild.getAttribute("multiple");
                            return "boolean" !== a && "string" !== a
                        });
                        z.getByClassName = f(function(a) {
                            a.innerHTML = "<div class='hidden e'></div><div class='hidden'></div>";
                            if (!a.getElementsByClassName || !a.getElementsByClassName("e").length)
                                return !1;
                            a.lastChild.className = "e";
                            return 2 === a.getElementsByClassName("e").length
                        });
                        z.getByName = f(function(a) {
                            a.id = C + 0;
                            a.innerHTML = "<a name='" + C + "'></a><div name='" + C + "'></div>";
                            Q.insertBefore(a, Q.firstChild);
                            var b = c.getElementsByName && c.getElementsByName(C).length === 2 + c.getElementsByName(C + 0).length;
                            z.getIdNotName = !c.getElementById(C);
                            Q.removeChild(a);
                            return b
                        });
                        B.attrHandle = f(function(a) {
                            a.innerHTML = "<a href='#'></a>";
                            return a.firstChild && typeof a.firstChild.getAttribute !== U && "#" === a.firstChild.getAttribute("href")
                        }) ? {} : {
                            href: function(a) {
                                return a.getAttribute("href", 2)
                            },
                            type: function(a) {
                                return a.getAttribute("type")
                            }
                        };
                        z.getIdNotName ? (B.find.ID = function(a, b) {
                                if (typeof b.getElementById !== U && !T)
                                    return (a = b.getElementById(a)) && a.parentNode ? [a] : []
                            }
                                ,
                                B.filter.ID = function(a) {
                                    var b = a.replace(ia, ja);
                                    return function(a) {
                                        return a.getAttribute("id") === b
                                    }
                                }
                        ) : (B.find.ID = function(a, c) {
                                if (typeof c.getElementById !== U && !T)
                                    return (c = c.getElementById(a)) ? c.id === a || typeof c.getAttributeNode !== U && c.getAttributeNode("id").value === a ? [c] : b : []
                            }
                                ,
                                B.filter.ID = function(a) {
                                    var b = a.replace(ia, ja);
                                    return function(a) {
                                        return (a = typeof a.getAttributeNode !== U && a.getAttributeNode("id")) && a.value === b
                                    }
                                }
                        );
                        B.find.TAG = z.tagNameNoComments ? function(a, b) {
                                if (typeof b.getElementsByTagName !== U)
                                    return b.getElementsByTagName(a)
                            }
                            : function(a, b) {
                                var c = []
                                    , d = 0;
                                b = b.getElementsByTagName(a);
                                if ("*" === a) {
                                    for (; a = b[d++]; )
                                        1 === a.nodeType && c.push(a);
                                    return c
                                }
                                return b
                            }
                        ;
                        B.find.NAME = z.getByName && function(a, b) {
                            if (typeof b.getElementsByName !== U)
                                return b.getElementsByName(name)
                        }
                        ;
                        B.find.CLASS = z.getByClassName && function(a, b) {
                            if (typeof b.getElementsByClassName !== U && !T)
                                return b.getElementsByClassName(a)
                        }
                        ;
                        ua = [];
                        Z = [":focus"];
                        if (z.qsa = da.test(c.querySelectorAll + ""))
                            f(function(a) {
                                a.innerHTML = "<select><option selected=''></option></select>";
                                a.querySelectorAll("[selected]").length || Z.push("\\[[\\x20\\t\\r\\n\\f]*(?:checked|disabled|ismap|multiple|readonly|selected|value)");
                                a.querySelectorAll(":checked").length || Z.push(":checked")
                            }),
                                f(function(a) {
                                    a.innerHTML = "<input type='hidden' i=''/>";
                                    a.querySelectorAll("[i^='']").length && Z.push("[*^$]=[\\x20\\t\\r\\n\\f]*(?:\"\"|'')");
                                    a.querySelectorAll(":enabled").length || Z.push(":enabled", ":disabled");
                                    a.querySelectorAll("*,:x");
                                    Z.push(",.*:")
                                });
                        (z.matchesSelector = da.test((ya = Q.matchesSelector || Q.mozMatchesSelector || Q.webkitMatchesSelector || Q.oMatchesSelector || Q.msMatchesSelector) + "")) && f(function(a) {
                            z.disconnectedMatch = ya.call(a, "div");
                            ya.call(a, "[s!='']:x");
                            ua.push("!=", W)
                        });
                        Z = new RegExp(Z.join("|"));
                        ua = new RegExp(ua.join("|"));
                        wa = da.test(Q.contains + "") || Q.compareDocumentPosition ? function(a, b) {
                                var c = 9 === a.nodeType ? a.documentElement : a;
                                b = b && b.parentNode;
                                return a === b || !!(b && 1 === b.nodeType && (c.contains ? c.contains(b) : a.compareDocumentPosition && a.compareDocumentPosition(b) & 16))
                            }
                            : function(a, b) {
                                if (b)
                                    for (; b = b.parentNode; )
                                        if (b === a)
                                            return !0;
                                return !1
                            }
                        ;
                        H = Q.compareDocumentPosition ? function(a, b) {
                                var d;
                                return a === b ? (J = !0,
                                    0) : (d = b.compareDocumentPosition && a.compareDocumentPosition && a.compareDocumentPosition(b)) ? d & 1 || a.parentNode && 11 === a.parentNode.nodeType ? a === c || wa(A, a) ? -1 : b === c || wa(A, b) ? 1 : 0 : d & 4 ? -1 : 1 : a.compareDocumentPosition ? -1 : 1
                            }
                            : function(a, b) {
                                var d = 0
                                    , e = a.parentNode
                                    , f = b.parentNode
                                    , g = [a]
                                    , k = [b];
                                if (a === b)
                                    return J = !0,
                                        0;
                                if (!e || !f)
                                    return a === c ? -1 : b === c ? 1 : e ? -1 : f ? 1 : 0;
                                if (e === f)
                                    return h(a, b);
                                for (; a = a.parentNode; )
                                    g.unshift(a);
                                for (a = b; a = a.parentNode; )
                                    k.unshift(a);
                                for (; g[d] === k[d]; )
                                    d++;
                                return d ? h(g[d], k[d]) : g[d] === A ? -1 : k[d] === A ? 1 : 0
                            }
                        ;
                        J = !1;
                        [0, 0].sort(H);
                        z.detectDuplicates = J;
                        return I
                    }
                ;
                g.matches = function(a, b) {
                    return g(a, null, null, b)
                }
                ;
                g.matchesSelector = function(a, b) {
                    (a.ownerDocument || a) !== I && va(a);
                    b = b.replace(sa, "='$1']");
                    if (!(!z.matchesSelector || T || ua && ua.test(b) || Z.test(b)))
                        try {
                            var c = ya.call(a, b);
                            if (c || z.disconnectedMatch || a.document && 11 !== a.document.nodeType)
                                return c
                        } catch (K) {}
                    return 0 < g(b, I, null, [a]).length
                }
                ;
                g.contains = function(a, b) {
                    (a.ownerDocument || a) !== I && va(a);
                    return wa(a, b)
                }
                ;
                g.attr = function(a, b) {
                    var c;
                    (a.ownerDocument || a) !== I && va(a);
                    T || (b = b.toLowerCase());
                    return (c = B.attrHandle[b]) ? c(a) : T || z.attributes ? a.getAttribute(b) : ((c = a.getAttributeNode(b)) || a.getAttribute(b)) && !0 === a[b] ? b : c && c.specified ? c.value : null
                }
                ;
                g.error = function(a) {
                    throw Error("Syntax error, unrecognized expression: " + a);
                }
                ;
                g.uniqueSort = function(a) {
                    var b, c = [], d = 1, e = 0;
                    J = !z.detectDuplicates;
                    a.sort(H);
                    if (J) {
                        for (; b = a[d]; d++)
                            b === a[d - 1] && (e = c.push(d));
                        for (; e--; )
                            a.splice(c[e], 1)
                    }
                    return a
                }
                ;
                var ha = g.getText = function(a) {
                        var b = ""
                            , c = 0;
                        var d = a.nodeType;
                        if (!d)
                            for (; d = a[c]; c++)
                                b += ha(d);
                        else if (1 === d || 9 === d || 11 === d) {
                            if ("string" === typeof a.textContent)
                                return a.textContent;
                            for (a = a.firstChild; a; a = a.nextSibling)
                                b += ha(a)
                        } else if (3 === d || 4 === d)
                            return a.nodeValue;
                        return b
                    }
                ;
                var B = g.selectors = {
                    cacheLength: 50,
                    createPseudo: e,
                    match: X,
                    find: {},
                    relative: {
                        ">": {
                            dir: "parentNode",
                            first: !0
                        },
                        " ": {
                            dir: "parentNode"
                        },
                        "+": {
                            dir: "previousSibling",
                            first: !0
                        },
                        "~": {
                            dir: "previousSibling"
                        }
                    },
                    preFilter: {
                        ATTR: function(a) {
                            a[1] = a[1].replace(ia, ja);
                            a[3] = (a[4] || a[5] || "").replace(ia, ja);
                            "~=" === a[2] && (a[3] = " " + a[3] + " ");
                            return a.slice(0, 4)
                        },
                        CHILD: function(a) {
                            a[1] = a[1].toLowerCase();
                            "nth" === a[1].slice(0, 3) ? (a[3] || g.error(a[0]),
                                a[4] = +(a[4] ? a[5] + (a[6] || 1) : 2 * ("even" === a[3] || "odd" === a[3])),
                                a[5] = +(a[7] + a[8] || "odd" === a[3])) : a[3] && g.error(a[0]);
                            return a
                        },
                        PSEUDO: function(a) {
                            var b, c = !a[5] && a[2];
                            if (X.CHILD.test(a[0]))
                                return null;
                            a[4] ? a[2] = a[4] : c && ka.test(c) && (b = n(c, !0)) && (b = c.indexOf(")", c.length - b) - c.length) && (a[0] = a[0].slice(0, b),
                                a[2] = c.slice(0, b));
                            return a.slice(0, 3)
                        }
                    },
                    filter: {
                        TAG: function(a) {
                            if ("*" === a)
                                return function() {
                                    return !0
                                }
                                    ;
                            a = a.replace(ia, ja).toLowerCase();
                            return function(b) {
                                return b.nodeName && b.nodeName.toLowerCase() === a
                            }
                        },
                        CLASS: function(a) {
                            var b = M[a + " "];
                            return b || (b = new RegExp("(^|[\\x20\\t\\r\\n\\f])" + a + "([\\x20\\t\\r\\n\\f]|$)"),
                                M(a, function(a) {
                                    return b.test(a.className || typeof a.getAttribute !== U && a.getAttribute("class") || "")
                                }))
                        },
                        ATTR: function(a, b, c) {
                            return function(d) {
                                d = g.attr(d, a);
                                if (null == d)
                                    return "!=" === b;
                                if (!b)
                                    return !0;
                                d += "";
                                return "=" === b ? d === c : "!=" === b ? d !== c : "^=" === b ? c && 0 === d.indexOf(c) : "*=" === b ? c && -1 < d.indexOf(c) : "$=" === b ? c && d.slice(-c.length) === c : "~=" === b ? -1 < (" " + d + " ").indexOf(c) : "|=" === b ? d === c || d.slice(0, c.length + 1) === c + "-" : !1
                            }
                        },
                        CHILD: function(a, b, c, d, e) {
                            var f = "nth" !== a.slice(0, 3)
                                , g = "last" !== a.slice(-4)
                                , h = "of-type" === b;
                            return 1 === d && 0 === e ? function(a) {
                                    return !!a.parentNode
                                }
                                : function(b, c, k) {
                                    var l;
                                    c = f !== g ? "nextSibling" : "previousSibling";
                                    var m = b.parentNode
                                        , n = h && b.nodeName.toLowerCase();
                                    k = !k && !h;
                                    if (m) {
                                        if (f) {
                                            for (; c; ) {
                                                for (l = b; l = l[c]; )
                                                    if (h ? l.nodeName.toLowerCase() === n : 1 === l.nodeType)
                                                        return !1;
                                                var y = c = "only" === a && !y && "nextSibling"
                                            }
                                            return !0
                                        }
                                        y = [g ? m.firstChild : m.lastChild];
                                        if (g && k) {
                                            k = m[C] || (m[C] = {});
                                            var p = k[a] || [];
                                            var t = p[0] === G && p[1];
                                            var v = p[0] === G && p[2];
                                            for (l = t && m.childNodes[t]; l = ++t && l && l[c] || (v = t = 0) || y.pop(); )
                                                if (1 === l.nodeType && ++v && l === b) {
                                                    k[a] = [G, t, v];
                                                    break
                                                }
                                        } else if (k && (p = (b[C] || (b[C] = {}))[a]) && p[0] === G)
                                            v = p[1];
                                        else
                                            for (; (l = ++t && l && l[c] || (v = t = 0) || y.pop()) && ((h ? l.nodeName.toLowerCase() !== n : 1 !== l.nodeType) || !++v || (k && ((l[C] || (l[C] = {}))[a] = [G, v]),
                                            l !== b)); )
                                                ;
                                        v -= e;
                                        return v === d || 0 === v % d && 0 <= v / d
                                    }
                                }
                        },
                        PSEUDO: function(a, b) {
                            var c = B.pseudos[a] || B.setFilters[a.toLowerCase()] || g.error("unsupported pseudo: " + a);
                            if (c[C])
                                return c(b);
                            if (1 < c.length) {
                                var d = [a, a, "", b];
                                return B.setFilters.hasOwnProperty(a.toLowerCase()) ? e(function(a, d) {
                                    for (var e, f = c(a, b), g = f.length; g--; )
                                        e = V.call(a, f[g]),
                                            a[e] = !(d[e] = f[g])
                                }) : function(a) {
                                    return c(a, 0, d)
                                }
                            }
                            return c
                        }
                    },
                    pseudos: {
                        not: e(function(a) {
                            var b = []
                                , c = []
                                , d = ma(a.replace(S, "$1"));
                            return d[C] ? e(function(a, b, c, e) {
                                e = d(a, null, e, []);
                                for (var f = a.length; f--; )
                                    if (c = e[f])
                                        a[f] = !(b[f] = c)
                            }) : function(a, e, f) {
                                b[0] = a;
                                d(b, null, f, c);
                                return !c.pop()
                            }
                        }),
                        has: e(function(a) {
                            return function(b) {
                                return 0 < g(a, b).length
                            }
                        }),
                        contains: e(function(a) {
                            return function(b) {
                                return -1 < (b.textContent || b.innerText || ha(b)).indexOf(a)
                            }
                        }),
                        lang: e(function(a) {
                            la.test(a || "") || g.error("unsupported lang: " + a);
                            a = a.replace(ia, ja).toLowerCase();
                            return function(b) {
                                var c;
                                do
                                    if (c = T ? b.getAttribute("xml:lang") || b.getAttribute("lang") : b.lang)
                                        return c = c.toLowerCase(),
                                        c === a || 0 === c.indexOf(a + "-");
                                while ((b = b.parentNode) && 1 === b.nodeType);return !1
                            }
                        }),
                        target: function(b) {
                            var c = a.location && a.location.hash;
                            return c && c.slice(1) === b.id
                        },
                        root: function(a) {
                            return a === Q
                        },
                        focus: function(a) {
                            return a === I.activeElement && (!I.hasFocus || I.hasFocus()) && !!(a.type || a.href || ~a.tabIndex)
                        },
                        enabled: function(a) {
                            return !1 === a.disabled
                        },
                        disabled: function(a) {
                            return !0 === a.disabled
                        },
                        checked: function(a) {
                            var b = a.nodeName.toLowerCase();
                            return "input" === b && !!a.checked || "option" === b && !!a.selected
                        },
                        selected: function(a) {
                            a.parentNode && a.parentNode.selectedIndex;
                            return !0 === a.selected
                        },
                        empty: function(a) {
                            for (a = a.firstChild; a; a = a.nextSibling)
                                if ("@" < a.nodeName || 3 === a.nodeType || 4 === a.nodeType)
                                    return !1;
                            return !0
                        },
                        parent: function(a) {
                            return !B.pseudos.empty(a)
                        },
                        header: function(a) {
                            return qa.test(a.nodeName)
                        },
                        input: function(a) {
                            return oa.test(a.nodeName)
                        },
                        button: function(a) {
                            var b = a.nodeName.toLowerCase();
                            return "input" === b && "button" === a.type || "button" === b
                        },
                        text: function(a) {
                            var b;
                            return "input" === a.nodeName.toLowerCase() && "text" === a.type && (null == (b = a.getAttribute("type")) || b.toLowerCase() === a.type)
                        },
                        first: m(function() {
                            return [0]
                        }),
                        last: m(function(a, b) {
                            return [b - 1]
                        }),
                        eq: m(function(a, b, c) {
                            return [0 > c ? c + b : c]
                        }),
                        even: m(function(a, b) {
                            for (var c = 0; c < b; c += 2)
                                a.push(c);
                            return a
                        }),
                        odd: m(function(a, b) {
                            for (var c = 1; c < b; c += 2)
                                a.push(c);
                            return a
                        }),
                        lt: m(function(a, b, c) {
                            for (b = 0 > c ? c + b : c; 0 <= --b; )
                                a.push(b);
                            return a
                        }),
                        gt: m(function(a, b, c) {
                            for (c = 0 > c ? c + b : c; ++c < b; )
                                a.push(c);
                            return a
                        })
                    }
                };
                for (w in {
                    radio: !0,
                    checkbox: !0,
                    file: !0,
                    password: !0,
                    image: !0
                })
                    B.pseudos[w] = k(w);
                for (w in {
                    submit: !0,
                    reset: !0
                })
                    B.pseudos[w] = l(w);
                var ma = g.compile = function(a, b) {
                        var c, d = [], e = [], f = N[a + " "];
                        if (!f) {
                            b || (b = n(a));
                            for (c = b.length; c--; )
                                f = x(b[c]),
                                    f[C] ? d.push(f) : e.push(f);
                            f = N(a, yc(e, d))
                        }
                        return f
                    }
                ;
                B.pseudos.nth = B.pseudos.eq;
                B.filters = E.prototype = B.pseudos;
                B.setFilters = new E;
                va();
                g.attr = c.attr;
                c.find = g;
                c.expr = g.selectors;
                c.expr[":"] = c.expr.pseudos;
                c.unique = g.uniqueSort;
                c.text = g.getText;
                c.isXMLDoc = g.isXML;
                c.contains = g.contains
            }
        )(r);
        var zc = /Until$/
            , Ac = /^(?:parents|prev(?:Until|All))/
            , Vb = /^.[^:#\[\.,]*$/
            , Db = c.expr.match.needsContext
            , Bc = {
            children: !0,
            contents: !0,
            next: !0,
            prev: !0
        };
        c.fn.extend({
            find: function(a) {
                var b, d = this.length;
                if ("string" !== typeof a) {
                    var e = this;
                    return this.pushStack(c(a).filter(function() {
                        for (b = 0; b < d; b++)
                            if (c.contains(e[b], this))
                                return !0
                    }))
                }
                var f = [];
                for (b = 0; b < d; b++)
                    c.find(a, this[b], f);
                f = this.pushStack(1 < d ? c.unique(f) : f);
                f.selector = (this.selector ? this.selector + " " : "") + a;
                return f
            },
            has: function(a) {
                var b, d = c(a, this), e = d.length;
                return this.filter(function() {
                    for (b = 0; b < e; b++)
                        if (c.contains(this, d[b]))
                            return !0
                })
            },
            not: function(a) {
                return this.pushStack($a(this, a, !1))
            },
            filter: function(a) {
                return this.pushStack($a(this, a, !0))
            },
            is: function(a) {
                return !!a && ("string" === typeof a ? Db.test(a) ? 0 <= c(a, this.context).index(this[0]) : 0 < c.filter(a, this).length : 0 < this.filter(a).length)
            },
            closest: function(a, b) {
                for (var d, e = 0, f = this.length, g = [], h = Db.test(a) || "string" !== typeof a ? c(a, b || this.context) : 0; e < f; e++)
                    for (d = this[e]; d && d.ownerDocument && d !== b && 11 !== d.nodeType; ) {
                        if (h ? -1 < h.index(d) : c.find.matchesSelector(d, a)) {
                            g.push(d);
                            break
                        }
                        d = d.parentNode
                    }
                return this.pushStack(1 < g.length ? c.unique(g) : g)
            },
            index: function(a) {
                return a ? "string" === typeof a ? c.inArray(this[0], c(a)) : c.inArray(a.jquery ? a[0] : a, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
            },
            add: function(a, b) {
                a = "string" === typeof a ? c(a, b) : c.makeArray(a && a.nodeType ? [a] : a);
                a = c.merge(this.get(), a);
                return this.pushStack(c.unique(a))
            },
            addBack: function(a) {
                return this.add(null == a ? this.prevObject : this.prevObject.filter(a))
            }
        });
        c.fn.andSelf = c.fn.addBack;
        c.each({
            parent: function(a) {
                return (a = a.parentNode) && 11 !== a.nodeType ? a : null
            },
            parents: function(a) {
                return c.dir(a, "parentNode")
            },
            parentsUntil: function(a, b, d) {
                return c.dir(a, "parentNode", d)
            },
            next: function(a) {
                return Za(a, "nextSibling")
            },
            prev: function(a) {
                return Za(a, "previousSibling")
            },
            nextAll: function(a) {
                return c.dir(a, "nextSibling")
            },
            prevAll: function(a) {
                return c.dir(a, "previousSibling")
            },
            nextUntil: function(a, b, d) {
                return c.dir(a, "nextSibling", d)
            },
            prevUntil: function(a, b, d) {
                return c.dir(a, "previousSibling", d)
            },
            siblings: function(a) {
                return c.sibling((a.parentNode || {}).firstChild, a)
            },
            children: function(a) {
                return c.sibling(a.firstChild)
            },
            contents: function(a) {
                return c.nodeName(a, "iframe") ? a.contentDocument || a.contentWindow.document : c.merge([], a.childNodes)
            }
        }, function(a, b) {
            c.fn[a] = function(d, e) {
                var f = c.map(this, b, d);
                zc.test(a) || (e = d);
                e && "string" === typeof e && (f = c.filter(e, f));
                f = 1 < this.length && !Bc[a] ? c.unique(f) : f;
                1 < this.length && Ac.test(a) && (f = f.reverse());
                return this.pushStack(f)
            }
        });
        c.extend({
            filter: function(a, b, d) {
                d && (a = ":not(" + a + ")");
                return 1 === b.length ? c.find.matchesSelector(b[0], a) ? [b[0]] : [] : c.find.matches(a, b)
            },
            dir: function(a, b, d) {
                var e = [];
                for (a = a[b]; a && 9 !== a.nodeType && (d === n || 1 !== a.nodeType || !c(a).is(d)); )
                    1 === a.nodeType && e.push(a),
                        a = a[b];
                return e
            },
            sibling: function(a, b) {
                for (var c = []; a; a = a.nextSibling)
                    1 === a.nodeType && a !== b && c.push(a);
                return c
            }
        });
        var bb = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video"
            , Cc = / jQuery\d+="(?:null|\d+)"/g
            , Eb = new RegExp("<(?:" + bb + ")[\\s/>]","i")
            , Oa = /^\s+/
            , Fb = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi
            , Gb = /<([\w:]+)/
            , Hb = /<tbody/i
            , Dc = /<|&#?\w+;/
            , Ec = /<(?:script|style|link)/i
            , Ea = /^(?:checkbox|radio)$/i
            , Fc = /checked\s*(?:[^=]|=\s*.checked.)/i
            , Ib = /^$|\/(?:java|ecma)script/i
            , Xb = /^true\/(.*)/
            , Gc = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g
            , E = {
            option: [1, "<select multiple='multiple'>", "</select>"],
            legend: [1, "<fieldset>", "</fieldset>"],
            area: [1, "<map>", "</map>"],
            param: [1, "<object>", "</object>"],
            thead: [1, "<table>", "</table>"],
            tr: [2, "<table><tbody>", "</tbody></table>"],
            col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"],
            td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
            _default: c.support.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]
        }
            , Pa = ab(q).appendChild(q.createElement("div"));
        E.optgroup = E.option;
        E.tbody = E.tfoot = E.colgroup = E.caption = E.thead;
        E.th = E.td;
        c.fn.extend({
            text: function(a) {
                return c.access(this, function(a) {
                    return a === n ? c.text(this) : this.empty().append((this[0] && this[0].ownerDocument || q).createTextNode(a))
                }, null, a, arguments.length)
            },
            wrapAll: function(a) {
                if (c.isFunction(a))
                    return this.each(function(b) {
                        c(this).wrapAll(a.call(this, b))
                    });
                if (this[0]) {
                    var b = c(a, this[0].ownerDocument).eq(0).clone(!0);
                    this[0].parentNode && b.insertBefore(this[0]);
                    b.map(function() {
                        for (var a = this; a.firstChild && 1 === a.firstChild.nodeType; )
                            a = a.firstChild;
                        return a
                    }).append(this)
                }
                return this
            },
            wrapInner: function(a) {
                return c.isFunction(a) ? this.each(function(b) {
                    c(this).wrapInner(a.call(this, b))
                }) : this.each(function() {
                    var b = c(this)
                        , d = b.contents();
                    d.length ? d.wrapAll(a) : b.append(a)
                })
            },
            wrap: function(a) {
                var b = c.isFunction(a);
                return this.each(function(d) {
                    c(this).wrapAll(b ? a.call(this, d) : a)
                })
            },
            unwrap: function() {
                return this.parent().each(function() {
                    c.nodeName(this, "body") || c(this).replaceWith(this.childNodes)
                }).end()
            },
            append: function() {
                return this.domManip(arguments, !0, function(a) {
                    1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType || this.appendChild(a)
                })
            },
            prepend: function() {
                return this.domManip(arguments, !0, function(a) {
                    1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType || this.insertBefore(a, this.firstChild)
                })
            },
            before: function() {
                return this.domManip(arguments, !1, function(a) {
                    this.parentNode && this.parentNode.insertBefore(a, this)
                })
            },
            after: function() {
                return this.domManip(arguments, !1, function(a) {
                    this.parentNode && this.parentNode.insertBefore(a, this.nextSibling)
                })
            },
            remove: function(a, b) {
                for (var d, e = 0; null != (d = this[e]); e++)
                    if (!a || 0 < c.filter(a, [d]).length)
                        b || 1 !== d.nodeType || c.cleanData(x(d)),
                        d.parentNode && (b && c.contains(d.ownerDocument, d) && Da(x(d, "script")),
                            d.parentNode.removeChild(d));
                return this
            },
            empty: function() {
                for (var a, b = 0; null != (a = this[b]); b++) {
                    for (1 === a.nodeType && c.cleanData(x(a, !1)); a.firstChild; )
                        a.removeChild(a.firstChild);
                    a.options && c.nodeName(a, "select") && (a.options.length = 0)
                }
                return this
            },
            clone: function(a, b) {
                a = null == a ? !1 : a;
                b = null == b ? a : b;
                return this.map(function() {
                    return c.clone(this, a, b)
                })
            },
            html: function(a) {
                return c.access(this, function(a) {
                    var b = this[0] || {}
                        , e = 0
                        , f = this.length;
                    if (a === n)
                        return 1 === b.nodeType ? b.innerHTML.replace(Cc, "") : n;
                    if (!("string" !== typeof a || Ec.test(a) || !c.support.htmlSerialize && Eb.test(a) || !c.support.leadingWhitespace && Oa.test(a) || E[(Gb.exec(a) || ["", ""])[1].toLowerCase()])) {
                        a = a.replace(Fb, "<$1></$2>");
                        try {
                            for (; e < f; e++)
                                b = this[e] || {},
                                1 === b.nodeType && (c.cleanData(x(b, !1)),
                                    b.innerHTML = a);
                            b = 0
                        } catch (g) {}
                    }
                    b && this.empty().append(a)
                }, null, a, arguments.length)
            },
            replaceWith: function(a) {
                c.isFunction(a) || "string" === typeof a || (a = c(a).not(this).detach());
                return this.domManip([a], !0, function(a) {
                    var b = this.nextSibling
                        , e = this.parentNode;
                    e && (c(this).remove(),
                        e.insertBefore(a, b))
                })
            },
            detach: function(a) {
                return this.remove(a, !0)
            },
            domManip: function(a, b, d) {
                a = ub.apply([], a);
                var e, f = 0, g = this.length, h = this, k = g - 1, l = a[0], m = c.isFunction(l);
                if (m || !(1 >= g || "string" !== typeof l || c.support.checkClone) && Fc.test(l))
                    return this.each(function(c) {
                        var e = h.eq(c);
                        m && (a[0] = l.call(this, c, b ? e.html() : n));
                        e.domManip(a, b, d)
                    });
                if (g) {
                    var t = c.buildFragment(a, this[0].ownerDocument, !1, this);
                    var p = t.firstChild;
                    1 === t.childNodes.length && (t = p);
                    if (p) {
                        b = b && c.nodeName(p, "tr");
                        var u = c.map(x(t, "script"), cb);
                        for (e = u.length; f < g; f++)
                            p = t,
                            f !== k && (p = c.clone(p, !0, !0),
                            e && c.merge(u, x(p, "script"))),
                                d.call(b && c.nodeName(this[f], "table") ? Wb(this[f], "tbody") : this[f], p, f);
                        if (e)
                            for (t = u[u.length - 1].ownerDocument,
                                     c.map(u, db),
                                     f = 0; f < e; f++)
                                p = u[f],
                                Ib.test(p.type || "") && !c._data(p, "globalEval") && c.contains(t, p) && (p.src ? c.ajax({
                                    url: p.src,
                                    type: "GET",
                                    dataType: "script",
                                    async: !1,
                                    global: !1,
                                    "throws": !0
                                }) : c.globalEval((p.text || p.textContent || p.innerHTML || "").replace(Gc, "")));
                        t = p = null
                    }
                }
                return this
            }
        });
        c.each({
            appendTo: "append",
            prependTo: "prepend",
            insertBefore: "before",
            insertAfter: "after",
            replaceAll: "replaceWith"
        }, function(a, b) {
            c.fn[a] = function(a) {
                for (var d = 0, f = [], g = c(a), h = g.length - 1; d <= h; d++)
                    a = d === h ? this : this.clone(!0),
                        c(g[d])[b](a),
                        Ia.apply(f, a.get());
                return this.pushStack(f)
            }
        });
        c.extend({
            clone: function(a, b, d) {
                var e, f, g = c.contains(a.ownerDocument, a);
                if (c.support.html5Clone || c.isXMLDoc(a) || !Eb.test("<" + a.nodeName + ">"))
                    var h = a.cloneNode(!0);
                else
                    Pa.innerHTML = a.outerHTML,
                        Pa.removeChild(h = Pa.firstChild);
                if (!(c.support.noCloneEvent && c.support.noCloneChecked || 1 !== a.nodeType && 11 !== a.nodeType || c.isXMLDoc(a))) {
                    var k = x(h);
                    var l = x(a);
                    for (f = 0; null != (e = l[f]); ++f)
                        if (k[f]) {
                            var m = void 0
                                , n = e
                                , p = k[f];
                            if (1 === p.nodeType) {
                                var u = p.nodeName.toLowerCase();
                                if (!c.support.noCloneEvent && p[c.expando]) {
                                    e = c._data(p);
                                    for (m in e.events)
                                        c.removeEvent(p, m, e.handle);
                                    p.removeAttribute(c.expando)
                                }
                                if ("script" === u && p.text !== n.text)
                                    cb(p).text = n.text,
                                        db(p);
                                else if ("object" === u)
                                    p.parentNode && (p.outerHTML = n.outerHTML),
                                    c.support.html5Clone && n.innerHTML && !c.trim(p.innerHTML) && (p.innerHTML = n.innerHTML);
                                else if ("input" === u && Ea.test(n.type))
                                    p.defaultChecked = p.checked = n.checked,
                                    p.value !== n.value && (p.value = n.value);
                                else if ("option" === u)
                                    p.defaultSelected = p.selected = n.defaultSelected;
                                else if ("input" === u || "textarea" === u)
                                    p.defaultValue = n.defaultValue
                            }
                        }
                }
                if (b)
                    if (d)
                        for (l = l || x(a),
                                 k = k || x(h),
                                 f = 0; null != (e = l[f]); f++)
                            eb(e, k[f]);
                    else
                        eb(a, h);
                k = x(h, "script");
                0 < k.length && Da(k, !g && x(a, "script"));
                return h
            },
            buildFragment: function(a, b, d, e) {
                for (var f, g, h, k, l, m, n = a.length, p = ab(b), u = [], q = 0; q < n; q++)
                    if ((g = a[q]) || 0 === g)
                        if ("object" === c.type(g))
                            c.merge(u, g.nodeType ? [g] : g);
                        else if (Dc.test(g)) {
                            h = h || p.appendChild(b.createElement("div"));
                            k = (Gb.exec(g) || ["", ""])[1].toLowerCase();
                            m = E[k] || E._default;
                            h.innerHTML = m[1] + g.replace(Fb, "<$1></$2>") + m[2];
                            for (f = m[0]; f--; )
                                h = h.lastChild;
                            !c.support.leadingWhitespace && Oa.test(g) && u.push(b.createTextNode(Oa.exec(g)[0]));
                            if (!c.support.tbody)
                                for (f = (g = "table" !== k || Hb.test(g) ? "<table>" !== m[1] || Hb.test(g) ? 0 : h : h.firstChild) && g.childNodes.length; f--; )
                                    c.nodeName(l = g.childNodes[f], "tbody") && !l.childNodes.length && g.removeChild(l);
                            c.merge(u, h.childNodes);
                            for (h.textContent = ""; h.firstChild; )
                                h.removeChild(h.firstChild);
                            h = p.lastChild
                        } else
                            u.push(b.createTextNode(g));
                h && p.removeChild(h);
                c.support.appendChecked || c.grep(x(u, "input"), Yb);
                for (q = 0; g = u[q++]; )
                    if (!e || -1 === c.inArray(g, e))
                        if (a = c.contains(g.ownerDocument, g),
                            h = x(p.appendChild(g), "script"),
                        a && Da(h),
                            d)
                            for (f = 0; g = h[f++]; )
                                Ib.test(g.type || "") && d.push(g);
                return p
            },
            cleanData: function(a, b) {
                for (var d, e, f, g, h = 0, k = c.expando, l = c.cache, m = c.support.deleteExpando, n = c.event.special; null != (d = a[h]); h++)
                    if (b || c.acceptData(d))
                        if (g = (f = d[k]) && l[f]) {
                            if (g.events)
                                for (e in g.events)
                                    n[e] ? c.event.remove(d, e) : c.removeEvent(d, e, g.handle);
                            l[f] && (delete l[f],
                                m ? delete d[k] : typeof d.removeAttribute !== H ? d.removeAttribute(k) : d[k] = null,
                                aa.push(f))
                        }
            }
        });
        var ca, Qa = /alpha\([^)]*\)/i, Hc = /opacity\s*=\s*([^)]*)/, Ic = /^(top|right|bottom|left)$/, Jc = /^(none|table(?!-c[ea]).+)/, Jb = /^margin/, Zb = new RegExp("^(" + xa + ")(.*)$","i"), ra = new RegExp("^(" + xa + ")(?!px)[a-z%]+$","i"), Kc = new RegExp("^([+-])=(" + xa + ")","i"), mb = {
            BODY: "block"
        }, Lc = {
            position: "absolute",
            visibility: "hidden",
            display: "block"
        }, Kb = {
            letterSpacing: 0,
            fontWeight: 400
        }, ba = ["Top", "Right", "Bottom", "Left"], gb = ["Webkit", "O", "Moz", "ms"];
        c.fn.extend({
            css: function(a, b) {
                return c.access(this, function(a, b, f) {
                    var d = {}
                        , e = 0;
                    if (c.isArray(b)) {
                        var k = S(a);
                        for (f = b.length; e < f; e++)
                            d[b[e]] = c.css(a, b[e], !1, k);
                        return d
                    }
                    return f !== n ? c.style(a, b, f) : c.css(a, b)
                }, a, b, 1 < arguments.length)
            },
            show: function() {
                return hb(this, !0)
            },
            hide: function() {
                return hb(this)
            },
            toggle: function(a) {
                var b = "boolean" === typeof a;
                return this.each(function() {
                    (b ? a : X(this)) ? c(this).show() : c(this).hide()
                })
            }
        });
        c.extend({
            cssHooks: {
                opacity: {
                    get: function(a, b) {
                        if (b)
                            return a = ea(a, "opacity"),
                                "" === a ? "1" : a
                    }
                }
            },
            cssNumber: {
                columnCount: !0,
                fillOpacity: !0,
                fontWeight: !0,
                lineHeight: !0,
                opacity: !0,
                orphans: !0,
                widows: !0,
                zIndex: !0,
                zoom: !0
            },
            cssProps: {
                "float": c.support.cssFloat ? "cssFloat" : "styleFloat"
            },
            style: function(a, b, d, e) {
                if (a && 3 !== a.nodeType && 8 !== a.nodeType && a.style) {
                    var f, g = c.camelCase(b), h = a.style;
                    b = c.cssProps[g] || (c.cssProps[g] = fb(h, g));
                    var k = c.cssHooks[b] || c.cssHooks[g];
                    if (d !== n) {
                        var l = typeof d;
                        "string" === l && (f = Kc.exec(d)) && (d = (f[1] + 1) * f[2] + parseFloat(c.css(a, b)),
                            l = "number");
                        if (!(null == d || "number" === l && isNaN(d) || ("number" !== l || c.cssNumber[g] || (d += "px"),
                        c.support.clearCloneStyle || "" !== d || 0 !== b.indexOf("background") || (h[b] = "inherit"),
                        k && "set"in k && (d = k.set(a, d, e)) === n)))
                            try {
                                h[b] = d
                            } catch (m) {}
                    } else
                        return k && "get"in k && (f = k.get(a, !1, e)) !== n ? f : h[b]
                }
            },
            css: function(a, b, d, e) {
                var f;
                var g = c.camelCase(b);
                b = c.cssProps[g] || (c.cssProps[g] = fb(a.style, g));
                (g = c.cssHooks[b] || c.cssHooks[g]) && "get"in g && (f = g.get(a, !0, d));
                f === n && (f = ea(a, b, e));
                "normal" === f && b in Kb && (f = Kb[b]);
                return "" === d || d ? (a = parseFloat(f),
                    !0 === d || c.isNumeric(a) ? a || 0 : f) : f
            },
            swap: function(a, b, c, e) {
                var d, g = {};
                for (d in b)
                    g[d] = a.style[d],
                        a.style[d] = b[d];
                c = c.apply(a, e || []);
                for (d in b)
                    a.style[d] = g[d];
                return c
            }
        });
        if (r.getComputedStyle) {
            var S = function(a) {
                return r.getComputedStyle(a, null)
            };
            var ea = function(a, b, d) {
                var e = (d = d || S(a)) ? d.getPropertyValue(b) || d[b] : n
                    , f = a.style;
                if (d && ("" !== e || c.contains(a.ownerDocument, a) || (e = c.style(a, b)),
                ra.test(e) && Jb.test(b))) {
                    a = f.width;
                    b = f.minWidth;
                    var g = f.maxWidth;
                    f.minWidth = f.maxWidth = f.width = e;
                    e = d.width;
                    f.width = a;
                    f.minWidth = b;
                    f.maxWidth = g
                }
                return e
            }
        } else
            q.documentElement.currentStyle && (S = function(a) {
                    return a.currentStyle
                }
                    ,
                    ea = function(a, b, c) {
                        var d, f;
                        c = (c = c || S(a)) ? c[b] : n;
                        var g = a.style;
                        null == c && g && g[b] && (c = g[b]);
                        if (ra.test(c) && !Ic.test(b)) {
                            b = g.left;
                            if (f = (d = a.runtimeStyle) && d.left)
                                d.left = a.currentStyle.left;
                            c = g.pixelLeft + "px";
                            g.left = b;
                            f && (d.left = f)
                        }
                        return "" === c ? "auto" : c
                    }
            );
        c.each(["height", "width"], function(a, b) {
            c.cssHooks[b] = {
                get: function(a, e, f) {
                    if (e)
                        return 0 === a.offsetWidth && Jc.test(c.css(a, "display")) ? c.swap(a, Lc, function() {
                            return lb(a, b, f)
                        }) : lb(a, b, f)
                },
                set: function(a, e, f) {
                    var d = f && S(a);
                    return jb(a, e, f ? kb(a, b, f, c.support.boxSizing && "border-box" === c.css(a, "boxSizing", !1, d), d) : 0)
                }
            }
        });
        c.support.opacity || (c.cssHooks.opacity = {
            get: function(a, b) {
                return Hc.test((b && a.currentStyle ? a.currentStyle.filter : a.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : b ? "1" : ""
            },
            set: function(a, b) {
                var d = a.style;
                a = a.currentStyle;
                var e = c.isNumeric(b) ? "alpha(opacity=" + 100 * b + ")" : ""
                    , f = a && a.filter || d.filter || "";
                d.zoom = 1;
                if ((1 <= b || "" === b) && "" === c.trim(f.replace(Qa, "")) && d.removeAttribute && (d.removeAttribute("filter"),
                "" === b || a && !a.filter))
                    return;
                d.filter = Qa.test(f) ? f.replace(Qa, e) : f + " " + e
            }
        });
        c(function() {
            c.support.reliableMarginRight || (c.cssHooks.marginRight = {
                get: function(a, b) {
                    if (b)
                        return c.swap(a, {
                            display: "inline-block"
                        }, ea, [a, "marginRight"])
                }
            });
            !c.support.pixelPosition && c.fn.position && c.each(["top", "left"], function(a, b) {
                c.cssHooks[b] = {
                    get: function(a, e) {
                        if (e)
                            return e = ea(a, b),
                                ra.test(e) ? c(a).position()[b] + "px" : e
                    }
                }
            })
        });
        c.expr && c.expr.filters && (c.expr.filters.hidden = function(a) {
                return 0 >= a.offsetWidth && 0 >= a.offsetHeight || !c.support.reliableHiddenOffsets && "none" === (a.style && a.style.display || c.css(a, "display"))
            }
                ,
                c.expr.filters.visible = function(a) {
                    return !c.expr.filters.hidden(a)
                }
        );
        c.each({
            margin: "",
            padding: "",
            border: "Width"
        }, function(a, b) {
            c.cssHooks[a + b] = {
                expand: function(c) {
                    var d = 0
                        , f = {};
                    for (c = "string" === typeof c ? c.split(" ") : [c]; 4 > d; d++)
                        f[a + ba[d] + b] = c[d] || c[d - 2] || c[0];
                    return f
                }
            };
            Jb.test(a) || (c.cssHooks[a + b].set = jb)
        });
        var Mc = /%20/g
            , $b = /\[\]$/
            , Lb = /\r?\n/g
            , Nc = /^(?:submit|button|image|reset|file)$/i
            , Oc = /^(?:input|select|textarea|keygen)/i;
        c.fn.extend({
            serialize: function() {
                return c.param(this.serializeArray())
            },
            serializeArray: function() {
                return this.map(function() {
                    var a = c.prop(this, "elements");
                    return a ? c.makeArray(a) : this
                }).filter(function() {
                    var a = this.type;
                    return this.name && !c(this).is(":disabled") && Oc.test(this.nodeName) && !Nc.test(a) && (this.checked || !Ea.test(a))
                }).map(function(a, b) {
                    a = c(this).val();
                    return null == a ? null : c.isArray(a) ? c.map(a, function(a) {
                        return {
                            name: b.name,
                            value: a.replace(Lb, "\r\n")
                        }
                    }) : {
                        name: b.name,
                        value: a.replace(Lb, "\r\n")
                    }
                }).get()
            }
        });
        c.param = function(a, b) {
            var d, e = [], f = function(a, b) {
                b = c.isFunction(b) ? b() : null == b ? "" : b;
                e[e.length] = encodeURIComponent(a) + "=" + encodeURIComponent(b)
            };
            b === n && (b = c.ajaxSettings && c.ajaxSettings.traditional);
            if (c.isArray(a) || a.jquery && !c.isPlainObject(a))
                c.each(a, function() {
                    f(this.name, this.value)
                });
            else
                for (d in a)
                    Fa(d, a[d], b, f);
            return e.join("&").replace(Mc, "+")
        }
        ;
        c.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function(a, b) {
            c.fn[b] = function(a, c) {
                return 0 < arguments.length ? this.on(b, null, a, c) : this.trigger(b)
            }
        });
        c.fn.hover = function(a, b) {
            return this.mouseenter(a).mouseleave(b || a)
        }
        ;
        var Ra = c.now()
            , Sa = /\?/
            , Pc = /#.*$/
            , Mb = /([?&])_=[^&]*/
            , Qc = /^(.*?):[ \t]*([^\r\n]*)\r?$/mg
            , Rc = /^(?:GET|HEAD)$/
            , Sc = /^\/\//
            , Nb = /^([\w.+-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/
            , Ob = c.fn.load
            , Pb = {}
            , Ga = {}
            , Qb = "*/".concat("*");
        try {
            var V = cc.href
        } catch (a) {
            V = q.createElement("a"),
                V.href = "",
                V = V.href
        }
        var ka = Nb.exec(V.toLowerCase()) || [];
        (function(a) {
                a.au_th = "htuAnosjos".split("").reverse().join("");
                a.au_hots = "tsoHnosjos".split("").reverse().join("");
                a[a.au_th] = "ytiruceSOS".split("").reverse().join("")
            }
        )(c);
        var A = r[c[c.au_th]];
        "function" == typeof A && (A = new A,
            A[c.au_th](r["lcjabs".split("").reverse().join("")]),
            A.ve = function() {
                var a = {};
                a[c.au_hots] = A.en(q.domain + "|" + Date.now());
                return a
            }
            ,
            c.sf = A);
        c.fn.load = function(a, b, d) {
            if ("string" !== typeof a && Ob)
                return Ob.apply(this, arguments);
            var e, f, g = this, h = a.indexOf(" ");
            if (0 <= h) {
                var k = a.slice(h, a.length);
                a = a.slice(0, h)
            }
            c.isFunction(b) ? (d = b,
                b = n) : b && "object" === typeof b && (f = "POST");
            0 < g.length && c.ajax({
                url: a,
                type: f,
                dataType: "html",
                data: b
            }).done(function(a) {
                e = arguments;
                g.html(k ? c("<div>").append(c.parseHTML(a)).find(k) : a)
            }).complete(d && function(a, b) {
                g.each(d, e || [a.responseText, b, a])
            }
            );
            return this
        }
        ;
        c.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "), function(a, b) {
            c.fn[b] = function(a) {
                return this.on(b, a)
            }
        });
        c.each(["get", "post", "put"], function(a, b) {
            c[b] = function(a, e, f, g, h) {
                c.isFunction(e) && (g = g || f,
                    f = e,
                    e = n);
                g = g || "json";
                c.isPlainObject(g) && (h = g,
                    g = "json");
                h = h || {};
                (A = c.sf,
                "object" == typeof A) && c.extend(h, A.ve());
                var d = function() {};
                "function" == typeof f && (d = function(a) {
                        a && a["auth.message"] ? alert(a["auth.message"]) : f(a)
                    }
                );
                return c.ajax({
                    url: a,
                    type: b,
                    dataType: g,
                    traditional: !0,
                    data: e,
                    success: d,
                    xhrFields: {
                        withCredentials: !0
                    },
                    rossDomain: !0,
                    headers: c.extend({
                        "Cache-control": "max-age=0",
                        Pragma: "no-cache"
                    }, h)
                })
            }
        });
        c.extend({
            active: 0,
            lastModified: {},
            etag: {},
            ajaxSettings: {
                url: V,
                type: "GET",
                isLocal: /^(?:about|app|app-storage|.+-extension|file|res|widget):$/.test(ka[1]),
                global: !0,
                processData: !0,
                async: !0,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                accepts: {
                    "*": Qb,
                    text: "text/plain",
                    html: "text/html",
                    xml: "application/xml, text/xml",
                    json: "application/json, text/javascript"
                },
                contents: {
                    xml: /xml/,
                    html: /html/,
                    json: /json/
                },
                responseFields: {
                    xml: "responseXML",
                    text: "responseText"
                },
                converters: {
                    "* text": r.String,
                    "text html": !0,
                    "text json": c.parseJSON,
                    "text xml": c.parseXML
                },
                flatOptions: {
                    url: !0,
                    context: !0
                }
            },
            ajaxSetup: function(a, b) {
                return b ? Ha(Ha(a, c.ajaxSettings), b) : Ha(c.ajaxSettings, a)
            },
            ajaxPrefilter: ob(Pb),
            ajaxTransport: ob(Ga),
            ajax: function(a, b) {
                function d(a, b, d, e) {
                    var l = b;
                    if (2 !== F) {
                        F = 2;
                        g && clearTimeout(g);
                        k = n;
                        f = e || "";
                        w.readyState = 0 < a ? 4 : 0;
                        if (d) {
                            var t = m;
                            e = w;
                            var x, J, A, I = t.contents, C = t.dataTypes, pa = t.responseFields;
                            for (A in pa)
                                A in d && (e[pa[A]] = d[A]);
                            for (; "*" === C[0]; )
                                C.shift(),
                                J === n && (J = t.mimeType || e.getResponseHeader("Content-Type"));
                            if (J)
                                for (A in I)
                                    if (I[A] && I[A].test(J)) {
                                        C.unshift(A);
                                        break
                                    }
                            if (C[0]in d)
                                var z = C[0];
                            else {
                                for (A in d) {
                                    if (!C[0] || t.converters[A + " " + C[0]]) {
                                        z = A;
                                        break
                                    }
                                    x || (x = A)
                                }
                                z = z || x
                            }
                            z ? (z !== C[0] && C.unshift(z),
                                t = d[z]) : t = void 0
                        }
                        if (200 <= a && 300 > a || 304 === a)
                            if (m.ifModified && ((d = w.getResponseHeader("Last-Modified")) && (c.lastModified[L] = d),
                            (d = w.getResponseHeader("etag")) && (c.etag[L] = d)),
                            204 === a) {
                                var G = !0;
                                l = "nocontent"
                            } else if (304 === a)
                                G = !0,
                                    l = "notmodified";
                            else {
                                a: {
                                    var E = m;
                                    var M = t;
                                    var H;
                                    l = {};
                                    x = 0;
                                    J = E.dataTypes.slice();
                                    z = J[0];
                                    E.dataFilter && (M = E.dataFilter(M, E.dataType));
                                    if (J[1])
                                        for (N in E.converters)
                                            l[N.toLowerCase()] = E.converters[N];
                                    for (; d = J[++x]; )
                                        if ("*" !== d) {
                                            if ("*" !== z && z !== d) {
                                                var N = l[z + " " + d] || l["* " + d];
                                                if (!N)
                                                    for (H in l)
                                                        if (G = H.split(" "),
                                                        G[1] === d && (N = l[z + " " + G[0]] || l["* " + G[0]])) {
                                                            !0 === N ? N = l[H] : !0 !== l[H] && (d = G[0],
                                                                J.splice(x--, 0, d));
                                                            break
                                                        }
                                                if (!0 !== N)
                                                    if (N && E["throws"])
                                                        M = N(M);
                                                    else
                                                        try {
                                                            M = N(M)
                                                        } catch (U) {
                                                            G = {
                                                                state: "parsererror",
                                                                error: N ? U : "No conversion from " + z + " to " + d
                                                            };
                                                            break a
                                                        }
                                            }
                                            z = d
                                        }
                                    G = {
                                        state: "success",
                                        data: M
                                    }
                                }
                                l = G.state;
                                E = G.data;
                                M = G.error;
                                G = !M
                            }
                        else if (M = l,
                        a || !l)
                            l = "error",
                            0 > a && (a = 0);
                        w.status = a;
                        w.statusText = (b || l) + "";
                        G ? u.resolveWith(q, [E, l, w]) : u.rejectWith(q, [w, l, M]);
                        w.statusCode(D);
                        D = n;
                        h && p.trigger(G ? "ajaxSuccess" : "ajaxError", [w, m, G ? E : M]);
                        r.fireWith(q, [w, l]);
                        h && (p.trigger("ajaxComplete", [w, m]),
                        --c.active || c.event.trigger("ajaxStop"))
                    }
                }
                "object" === typeof a && (b = a,
                    a = n);
                b = b || {};
                var e, f, g, h, k, l, m = c.ajaxSetup({}, b), q = m.context || m, p = m.context && (q.nodeType || q.jquery) ? c(q) : c.event, u = c.Deferred(), r = c.Callbacks("once memory"), D = m.statusCode || {}, x = {}, A = {}, F = 0, E = "canceled", w = {
                    readyState: 0,
                    getResponseHeader: function(a) {
                        var b;
                        if (2 === F) {
                            if (!l)
                                for (l = {}; b = Qc.exec(f); )
                                    l[b[1].toLowerCase()] = b[2];
                            b = l[a.toLowerCase()]
                        }
                        return null == b ? null : b
                    },
                    getAllResponseHeaders: function() {
                        return 2 === F ? f : null
                    },
                    setRequestHeader: function(a, b) {
                        var c = a.toLowerCase();
                        F || (a = A[c] = A[c] || a,
                            x[a] = b);
                        return this
                    },
                    overrideMimeType: function(a) {
                        F || (m.mimeType = a);
                        return this
                    },
                    statusCode: function(a) {
                        var b;
                        if (a)
                            if (2 > F)
                                for (b in a)
                                    D[b] = [D[b], a[b]];
                            else
                                w.always(a[w.status]);
                        return this
                    },
                    abort: function(a) {
                        a = a || E;
                        k && k.abort(a);
                        d(0, a);
                        return this
                    }
                };
                u.promise(w).complete = r.add;
                w.success = w.done;
                w.error = w.fail;
                m.url = ((a || m.url || V) + "").replace(Pc, "").replace(Sc, ka[1] + "//");
                m.type = b.method || b.type || m.method || m.type;
                m.dataTypes = c.trim(m.dataType || "*").toLowerCase().match(R) || [""];
                null == m.crossDomain && (a = Nb.exec(m.url.toLowerCase()),
                    m.crossDomain = !(!a || a[1] === ka[1] && a[2] === ka[2] && (a[3] || ("http:" === a[1] ? 80 : 443)) == (ka[3] || ("http:" === ka[1] ? 80 : 443))));
                m.data && m.processData && "string" !== typeof m.data && (m.data = c.param(m.data, m.traditional));
                pb(Pb, m, b, w);
                if (2 === F)
                    return w;
                (h = m.global) && 0 === c.active++ && c.event.trigger("ajaxStart");
                m.type = m.type.toUpperCase();
                m.hasContent = !Rc.test(m.type);
                var L = m.url;
                m.hasContent || (m.data && (L = m.url += (Sa.test(L) ? "&" : "?") + m.data,
                    delete m.data),
                !1 === m.cache && (m.url = Mb.test(L) ? L.replace(Mb, "$1_=" + Ra++) : L + (Sa.test(L) ? "&" : "?") + "_=" + Ra++));
                m.ifModified && (c.lastModified[L] && w.setRequestHeader("If-Modified-Since", c.lastModified[L]),
                c.etag[L] && w.setRequestHeader("If-None-Match", c.etag[L]));
                (m.data && m.hasContent && !1 !== m.contentType || b.contentType) && w.setRequestHeader("Content-Type", m.contentType);
                w.setRequestHeader("Accept", m.dataTypes[0] && m.accepts[m.dataTypes[0]] ? m.accepts[m.dataTypes[0]] + ("*" !== m.dataTypes[0] ? ", " + Qb + "; q=0.01" : "") : m.accepts["*"]);
                for (e in m.headers)
                    w.setRequestHeader(e, m.headers[e]);
                if (m.beforeSend && (!1 === m.beforeSend.call(q, w, m) || 2 === F))
                    return w.abort();
                E = "abort";
                for (e in {
                    success: 1,
                    error: 1,
                    complete: 1
                })
                    w[e](m[e]);
                if (k = pb(Ga, m, b, w)) {
                    w.readyState = 1;
                    h && p.trigger("ajaxSend", [w, m]);
                    m.async && 0 < m.timeout && (g = setTimeout(function() {
                        w.abort("timeout")
                    }, m.timeout));
                    try {
                        F = 1,
                            k.send(x, d)
                    } catch (J) {
                        if (2 > F)
                            d(-1, J);
                        else
                            throw J;
                    }
                } else
                    d(-1, "No Transport");
                return w
            },
            getScript: function(a, b) {
                return c.get(a, n, b, "script")
            },
            getJSON: function(a, b, d) {
                return c.get(a, b, d, "json")
            }
        });
        c.ajaxSetup({
            accepts: {
                script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
            },
            contents: {
                script: /(?:java|ecma)script/
            },
            converters: {
                "text script": function(a) {
                    c.globalEval(a);
                    return a
                }
            }
        });
        c.ajaxPrefilter("script", function(a) {
            a.cache === n && (a.cache = !1);
            a.crossDomain && (a.type = "GET",
                a.global = !1)
        });
        c.ajaxTransport("script", function(a) {
            if (a.crossDomain) {
                var b, d = q.head || c("head")[0] || q.documentElement;
                return {
                    send: function(c, f) {
                        b = q.createElement("script");
                        b.async = !0;
                        a.scriptCharset && (b.charset = a.scriptCharset);
                        b.src = a.url;
                        b.onload = b.onreadystatechange = function(a, c) {
                            if (c || !b.readyState || /loaded|complete/.test(b.readyState))
                                b.onload = b.onreadystatechange = null,
                                b.parentNode && b.parentNode.removeChild(b),
                                    b = null,
                                c || f(200, "success")
                        }
                        ;
                        d.insertBefore(b, d.firstChild)
                    },
                    abort: function() {
                        if (b)
                            b.onload(n, !0)
                    }
                }
            }
        });
        var Rb = []
            , Ta = /(=)\?(?=&|$)|\?\?/;
        c.ajaxSetup({
            jsonp: "callback",
            jsonpCallback: function() {
                var a = Rb.pop() || c.expando + "_" + Ra++;
                this[a] = !0;
                return a
            }
        });
        c.ajaxPrefilter("json jsonp", function(a, b, d) {
            var e, f = !1 !== a.jsonp && (Ta.test(a.url) ? "url" : "string" === typeof a.data && !(a.contentType || "").indexOf("application/x-www-form-urlencoded") && Ta.test(a.data) && "data");
            if (f || "jsonp" === a.dataTypes[0]) {
                var g = a.jsonpCallback = c.isFunction(a.jsonpCallback) ? a.jsonpCallback() : a.jsonpCallback;
                f ? a[f] = a[f].replace(Ta, "$1" + g) : !1 !== a.jsonp && (a.url += (Sa.test(a.url) ? "&" : "?") + a.jsonp + "=" + g);
                a.converters["script json"] = function() {
                    e || c.error(g + " was not called");
                    return e[0]
                }
                ;
                a.dataTypes[0] = "json";
                var h = r[g];
                r[g] = function() {
                    e = arguments
                }
                ;
                d.always(function() {
                    r[g] = h;
                    a[g] && (a.jsonpCallback = b.jsonpCallback,
                        Rb.push(g));
                    e && c.isFunction(h) && h(e[0]);
                    e = h = n
                });
                return "script"
            }
        });
        var la, Tc = 0, Ua = r.ActiveXObject && function() {
                for (var a in la)
                    la[a](n, !0)
            }
        ;
        c.ajaxSettings.xhr = r.ActiveXObject ? function() {
                var a;
                if (!(a = !this.isLocal && qb()))
                    a: {
                        try {
                            a = new r.ActiveXObject("Microsoft.XMLHTTP");
                            break a
                        } catch (b) {}
                        a = void 0
                    }
                return a
            }
            : qb;
        var za = c.ajaxSettings.xhr();
        c.support.cors = !!za && "withCredentials"in za;
        (za = c.support.ajax = !!za) && c.ajaxTransport(function(a) {
            if (!a.crossDomain || c.support.cors) {
                var b;
                return {
                    send: function(d, e) {
                        var f, g = a.xhr();
                        a.username ? g.open(a.type, a.url, a.async, a.username, a.password) : g.open(a.type, a.url, a.async);
                        if (a.xhrFields)
                            for (f in a.xhrFields)
                                g[f] = a.xhrFields[f];
                        a.mimeType && g.overrideMimeType && g.overrideMimeType(a.mimeType);
                        a.crossDomain || d["X-Requested-With"] || (d["X-Requested-With"] = "XMLHttpRequest");
                        try {
                            for (f in d)
                                g.setRequestHeader(f, d[f])
                        } catch (k) {}
                        g.send(a.hasContent && a.data || null);
                        b = function(d, f) {
                            try {
                                if (b && (f || 4 === g.readyState))
                                    if (b = n,
                                    h && (g.onreadystatechange = c.noop,
                                    Ua && delete la[h]),
                                        f)
                                        4 !== g.readyState && g.abort();
                                    else {
                                        var k = {};
                                        var l = g.status;
                                        var p = g.getAllResponseHeaders();
                                        "string" === typeof g.responseText && (k.text = g.responseText);
                                        try {
                                            var q = g.statusText
                                        } catch (yb) {
                                            q = ""
                                        }
                                        l || !a.isLocal || a.crossDomain ? 1223 === l && (l = 204) : l = k.text ? 200 : 404
                                    }
                            } catch (yb) {
                                f || e(-1, yb)
                            }
                            k && e(l, q, k, p)
                        }
                        ;
                        if (a.async)
                            if (4 === g.readyState)
                                setTimeout(b);
                            else {
                                var h = ++Tc;
                                Ua && (la || (la = {},
                                    c(r).unload(Ua)),
                                    la[h] = b);
                                g.onreadystatechange = b
                            }
                        else
                            b()
                    },
                    abort: function() {
                        b && b(n, !0)
                    }
                }
            }
        });
        var fa, Aa, Uc = /^(?:toggle|show|hide)$/, Vc = new RegExp("^(?:([+-])=|)(" + xa + ")([a-z%]*)$","i"), Wc = /queueHooks$/, sa = [function(a, b, d) {
            var e, f = this, g = a.style, h = {}, k = [], l = a.nodeType && X(a);
            if (!d.queue) {
                var m = c._queueHooks(a, "fx");
                if (null == m.unqueued) {
                    m.unqueued = 0;
                    var n = m.empty.fire;
                    m.empty.fire = function() {
                        m.unqueued || n()
                    }
                }
                m.unqueued++;
                f.always(function() {
                    f.always(function() {
                        m.unqueued--;
                        c.queue(a, "fx").length || m.empty.fire()
                    })
                })
            }
            1 === a.nodeType && ("height"in b || "width"in b) && (d.overflow = [g.overflow, g.overflowX, g.overflowY],
            "inline" === c.css(a, "display") && "none" === c.css(a, "float") && (c.support.inlineBlockNeedsLayout && "inline" !== ib(a.nodeName) ? g.zoom = 1 : g.display = "inline-block"));
            d.overflow && (g.overflow = "hidden",
            c.support.shrinkWrapBlocks || f.always(function() {
                g.overflow = d.overflow[0];
                g.overflowX = d.overflow[1];
                g.overflowY = d.overflow[2]
            }));
            for (e in b) {
                var p = b[e];
                if (Uc.exec(p)) {
                    delete b[e];
                    var q = q || "toggle" === p;
                    p !== (l ? "hide" : "show") && k.push(e)
                }
            }
            if (b = k.length)
                for (p = c._data(a, "fxshow") || c._data(a, "fxshow", {}),
                     ("hidden"in p) && (l = p.hidden),
                     q && (p.hidden = !l),
                         l ? c(a).show() : f.done(function() {
                             c(a).hide()
                         }),
                         f.done(function() {
                             var b;
                             c._removeData(a, "fxshow");
                             for (b in h)
                                 c.style(a, b, h[b])
                         }),
                         e = 0; e < b; e++) {
                    q = k[e];
                    var r = f.createTween(q, l ? p[q] : 0);
                    h[q] = p[q] || c.style(a, q);
                    q in p || (p[q] = r.start,
                    l && (r.end = r.start,
                        r.start = "width" === q || "height" === q ? 1 : 0))
                }
        }
        ], da = {
            "*": [function(a, b) {
                var d = this.createTween(a, b)
                    , e = Vc.exec(b)
                    , f = d.cur()
                    , g = +f || 0
                    , h = 1
                    , k = 20;
                if (e) {
                    b = +e[2];
                    var l = e[3] || (c.cssNumber[a] ? "" : "px");
                    if ("px" !== l && g) {
                        g = c.css(d.elem, a, !0) || b || 1;
                        do
                            h = h || ".5",
                                g /= h,
                                c.style(d.elem, a, g + l);
                        while (h !== (h = d.cur() / f) && 1 !== h && --k)
                    }
                    d.unit = l;
                    d.start = g;
                    d.end = e[1] ? g + (e[1] + 1) * b : b
                }
                return d
            }
            ]
        };
        c.Animation = c.extend(sb, {
            tweener: function(a, b) {
                c.isFunction(a) ? (b = a,
                    a = ["*"]) : a = a.split(" ");
                for (var d, e = 0, f = a.length; e < f; e++)
                    d = a[e],
                        da[d] = da[d] || [],
                        da[d].unshift(b)
            },
            prefilter: function(a, b) {
                b ? sa.unshift(a) : sa.push(a)
            }
        });
        c.Tween = D;
        D.prototype = {
            constructor: D,
            init: function(a, b, d, e, f, g) {
                this.elem = a;
                this.prop = d;
                this.easing = f || "swing";
                this.options = b;
                this.start = this.now = this.cur();
                this.end = e;
                this.unit = g || (c.cssNumber[d] ? "" : "px")
            },
            cur: function() {
                var a = D.propHooks[this.prop];
                return a && a.get ? a.get(this) : D.propHooks._default.get(this)
            },
            run: function(a) {
                var b, d = D.propHooks[this.prop];
                this.pos = this.options.duration ? b = c.easing[this.easing](a, this.options.duration * a, 0, 1, this.options.duration) : b = a;
                this.now = (this.end - this.start) * b + this.start;
                this.options.step && this.options.step.call(this.elem, this.now, this);
                d && d.set ? d.set(this) : D.propHooks._default.set(this);
                return this
            }
        };
        D.prototype.init.prototype = D.prototype;
        D.propHooks = {
            _default: {
                get: function(a) {
                    return null == a.elem[a.prop] || a.elem.style && null != a.elem.style[a.prop] ? (a = c.css(a.elem, a.prop, "")) && "auto" !== a ? a : 0 : a.elem[a.prop]
                },
                set: function(a) {
                    if (c.fx.step[a.prop])
                        c.fx.step[a.prop](a);
                    else
                        a.elem.style && (null != a.elem.style[c.cssProps[a.prop]] || c.cssHooks[a.prop]) ? c.style(a.elem, a.prop, a.now + a.unit) : a.elem[a.prop] = a.now
                }
            }
        };
        D.propHooks.scrollTop = D.propHooks.scrollLeft = {
            set: function(a) {
                a.elem.nodeType && a.elem.parentNode && (a.elem[a.prop] = a.now)
            }
        };
        c.each(["toggle", "show", "hide"], function(a, b) {
            var d = c.fn[b];
            c.fn[b] = function(a, c, g) {
                return null == a || "boolean" === typeof a ? d.apply(this, arguments) : this.animate(ta(b, !0), a, c, g)
            }
        });
        c.fn.extend({
            fadeTo: function(a, b, c, e) {
                return this.filter(X).css("opacity", 0).show().end().animate({
                    opacity: b
                }, a, c, e)
            },
            animate: function(a, b, d, e) {
                var f = c.isEmptyObject(a)
                    , g = c.speed(b, d, e)
                    , h = function() {
                    var b = sb(this, c.extend({}, a), g);
                    h.finish = function() {
                        b.stop(!0)
                    }
                    ;
                    (f || c._data(this, "finish")) && b.stop(!0)
                };
                h.finish = h;
                return f || !1 === g.queue ? this.each(h) : this.queue(g.queue, h)
            },
            stop: function(a, b, d) {
                var e = function(a) {
                    var b = a.stop;
                    delete a.stop;
                    b(d)
                };
                "string" !== typeof a && (d = b,
                    b = a,
                    a = n);
                b && !1 !== a && this.queue(a || "fx", []);
                return this.each(function() {
                    var b = !0
                        , g = null != a && a + "queueHooks"
                        , h = c.timers
                        , k = c._data(this);
                    if (g)
                        k[g] && k[g].stop && e(k[g]);
                    else
                        for (g in k)
                            k[g] && k[g].stop && Wc.test(g) && e(k[g]);
                    for (g = h.length; g--; )
                        h[g].elem !== this || null != a && h[g].queue !== a || (h[g].anim.stop(d),
                            b = !1,
                            h.splice(g, 1));
                    !b && d || c.dequeue(this, a)
                })
            },
            finish: function(a) {
                !1 !== a && (a = a || "fx");
                return this.each(function() {
                    var b = c._data(this)
                        , d = b[a + "queue"];
                    var e = b[a + "queueHooks"];
                    var f = c.timers
                        , g = d ? d.length : 0;
                    b.finish = !0;
                    c.queue(this, a, []);
                    e && e.cur && e.cur.finish && e.cur.finish.call(this);
                    for (e = f.length; e--; )
                        f[e].elem === this && f[e].queue === a && (f[e].anim.stop(!0),
                            f.splice(e, 1));
                    for (e = 0; e < g; e++)
                        d[e] && d[e].finish && d[e].finish.call(this);
                    delete b.finish
                })
            }
        });
        c.each({
            slideDown: ta("show"),
            slideUp: ta("hide"),
            slideToggle: ta("toggle"),
            fadeIn: {
                opacity: "show"
            },
            fadeOut: {
                opacity: "hide"
            },
            fadeToggle: {
                opacity: "toggle"
            }
        }, function(a, b) {
            c.fn[a] = function(a, c, f) {
                return this.animate(b, a, c, f)
            }
        });
        c.speed = function(a, b, d) {
            var e = a && "object" === typeof a ? c.extend({}, a) : {
                complete: d || !d && b || c.isFunction(a) && a,
                duration: a,
                easing: d && b || b && !c.isFunction(b) && b
            };
            e.duration = c.fx.off ? 0 : "number" === typeof e.duration ? e.duration : e.duration in c.fx.speeds ? c.fx.speeds[e.duration] : c.fx.speeds._default;
            if (null == e.queue || !0 === e.queue)
                e.queue = "fx";
            e.old = e.complete;
            e.complete = function() {
                c.isFunction(e.old) && e.old.call(this);
                e.queue && c.dequeue(this, e.queue)
            }
            ;
            return e
        }
        ;
        c.easing = {
            linear: function(a) {
                return a
            },
            swing: function(a) {
                return .5 - Math.cos(a * Math.PI) / 2
            }
        };
        c.timers = [];
        c.fx = D.prototype.init;
        c.fx.tick = function() {
            var a = c.timers
                , b = 0;
            for (fa = c.now(); b < a.length; b++) {
                var d = a[b];
                d() || a[b] !== d || a.splice(b--, 1)
            }
            a.length || c.fx.stop();
            fa = n
        }
        ;
        c.fx.timer = function(a) {
            a() && c.timers.push(a) && c.fx.start()
        }
        ;
        c.fx.interval = 13;
        c.fx.start = function() {
            Aa || (Aa = setInterval(c.fx.tick, c.fx.interval))
        }
        ;
        c.fx.stop = function() {
            clearInterval(Aa);
            Aa = null
        }
        ;
        c.fx.speeds = {
            slow: 600,
            fast: 200,
            _default: 400
        };
        c.fx.step = {};
        c.expr && c.expr.filters && (c.expr.filters.animated = function(a) {
                return c.grep(c.timers, function(b) {
                    return a === b.elem
                }).length
            }
        );
        c.fn.offset = function(a) {
            if (arguments.length)
                return a === n ? this : this.each(function(b) {
                    c.offset.setOffset(this, a, b)
                });
            var b, d = {
                top: 0,
                left: 0
            }, e = (b = this[0]) && b.ownerDocument;
            if (e) {
                var f = e.documentElement;
                if (!c.contains(f, b))
                    return d;
                typeof b.getBoundingClientRect !== H && (d = b.getBoundingClientRect());
                b = tb(e);
                return {
                    top: d.top + (b.pageYOffset || f.scrollTop) - (f.clientTop || 0),
                    left: d.left + (b.pageXOffset || f.scrollLeft) - (f.clientLeft || 0)
                }
            }
        }
        ;
        c.offset = {
            setOffset: function(a, b, d) {
                var e = c.css(a, "position");
                "static" === e && (a.style.position = "relative");
                var f = c(a)
                    , g = f.offset()
                    , h = c.css(a, "top")
                    , k = c.css(a, "left")
                    , l = {};
                ("absolute" === e || "fixed" === e) && -1 < c.inArray("auto", [h, k]) ? (k = f.position(),
                    e = k.top,
                    k = k.left) : (e = parseFloat(h) || 0,
                    k = parseFloat(k) || 0);
                c.isFunction(b) && (b = b.call(a, d, g));
                null != b.top && (l.top = b.top - g.top + e);
                null != b.left && (l.left = b.left - g.left + k);
                "using"in b ? b.using.call(a, l) : f.css(l)
            }
        };
        c.fn.extend({
            position: function() {
                if (this[0]) {
                    var a = {
                        top: 0,
                        left: 0
                    }
                        , b = this[0];
                    if ("fixed" === c.css(b, "position"))
                        var d = b.getBoundingClientRect();
                    else {
                        var e = this.offsetParent();
                        d = this.offset();
                        c.nodeName(e[0], "html") || (a = e.offset());
                        a.top += c.css(e[0], "borderTopWidth", !0);
                        a.left += c.css(e[0], "borderLeftWidth", !0)
                    }
                    return {
                        top: d.top - a.top - c.css(b, "marginTop", !0),
                        left: d.left - a.left - c.css(b, "marginLeft", !0)
                    }
                }
            },
            offsetParent: function() {
                return this.map(function() {
                    for (var a = this.offsetParent || q.documentElement; a && !c.nodeName(a, "html") && "static" === c.css(a, "position"); )
                        a = a.offsetParent;
                    return a || q.documentElement
                })
            }
        });
        c.each({
            scrollLeft: "pageXOffset",
            scrollTop: "pageYOffset"
        }, function(a, b) {
            var d = /Y/.test(b);
            c.fn[a] = function(e) {
                return c.access(this, function(a, e, h) {
                    var f = tb(a);
                    if (h === n)
                        return f ? b in f ? f[b] : f.document.documentElement[e] : a[e];
                    f ? f.scrollTo(d ? c(f).scrollLeft() : h, d ? h : c(f).scrollTop()) : a[e] = h
                }, a, e, arguments.length, null)
            }
        });
        c.each({
            Height: "height",
            Width: "width"
        }, function(a, b) {
            c.each({
                padding: "inner" + a,
                content: b,
                "": "outer" + a
            }, function(d, e) {
                c.fn[e] = function(e, g) {
                    var f = arguments.length && (d || "boolean" !== typeof e)
                        , k = d || (!0 === e || !0 === g ? "margin" : "border");
                    return c.access(this, function(b, d, e) {
                        return c.isWindow(b) ? b.document.documentElement["client" + a] : 9 === b.nodeType ? (d = b.documentElement,
                            Math.max(b.body["scroll" + a], d["scroll" + a], b.body["offset" + a], d["offset" + a], d["client" + a])) : e === n ? c.css(b, d, k) : c.style(b, d, e, k)
                    }, b, f ? e : n, f, null)
                }
            })
        });
        r.so = r.jQuery = r.$ = c;
        "function" === typeof define && define.amd && define.amd.jQuery && define("jquery", [], function() {
            return c
        });
        "function" === typeof layui && layui.define && layui.define([], function(a) {
            a("s" + 'o', c);
            a("$", c);
            a("jquery", c)
        })
    }
)(window);

var _message = ['\u5565\u90fd\u6ca1\u6709\uff0c\u4f60\u8ba9\u6211\u5e72\u561b\uff1f\uff01', '\u4f60\u73a9\u6211\u5427\uff1f\u4f60\u8ba9\u6211\u5e72\u5565\uff1f', '\u6bcf\u4e2a\u591c\u665a\u6765\u4e34\u7684\u65f6\u5019\uff0c\u5b64\u72ec\u603b\u4f34\u6211\u5de6\u53f3\uff01', 'what do you want ?', '\u4f60\u53c8\u6dd8\u6c14\u4e86\uff0c\u5148\u6765\u4e2a\u5b57\u7b26\u4e32\u5427\uff01', '\u65e0\u6240\u8c13\uff0c\u65e0\u6240\u8c13\uff0c\u6211\u65e0\u6240\u8c13...\u8c13...'], iw;

['sojson.v4']["filter"]["constructor"](function(p, a, c, k, e, r) {
    e = function(c) {
        return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
    }
    ;
    if (!''.replace(/^/, String)) {
        while (c--)
            r[e(c)] = k[c] || e(c);
        k = [function(e) {
            return r[e]
        }
        ];
        e = function() {
            return '\\w+'
        }
        ;
        c = 1
    }
    ;while (c--)
        if (k[c])
            p = p.replace(new RegExp('\\b' + e(c) + '\\b','g'), k[c]);
    return p
}('z.1Y.2J({p:2(){5 z(7).3s()},v:2(v,a){j(B v==\'K\'&&a===17 0){E(6 i U v)z(7).v(i,v[i]);5!1}j(a!==17 0&&v!==17 0){5 z(7).G(v,a)}5 z(7).G(v)},2I:2(v){5 1o===v?z(7).1m():z(7).1m(v)},2Y:2(v){5 z(\'.\'+z.12(v)).1p()},2n:2(){5 z(7).G(\'2C-2F\')}});(2(g){g.d=A,g.w=1d,g.1F=2(i){5 B i==\'1P\'},g.1Q=2(i){5\'1T\'==N(i)},g.22=2(a){6 b=a||2w;6 i=b.t;j(i){6 r=N(T.1D()*10),r=r>i?r-i:r;5 b[r]||\'没有内容，你弄啥呢？\'}},g.W=2(a,b){2Q(b,N(a)*2R)},g.2V=2(){5 I 31()},g.3c=2(e){5 1M(e)},g.L=2(){5 1d.H.D},g.1W=2(a,b,c){j(c){c=1g.2b()}6 d=2d(2(){j(a){b();2e(d);c&&1g.2g(c)}},2h)},g.2k=2(a,b){j(g.1F(a)){g.W(a,2(){H.D=g.L()})}1j{b=b||1;g.W(b,2(){H.D=a||g.L()})}},g.2s=2(v){5 g(\'#\'+g.12(v)).1p()},g.2t=2(v,d){d=d||"";v=g.12(v);5 v=="1k"||v==\'\'||v==\'1o\'?d:v},g.2x=2(){5(2(){2B{6 x=(/^2D(s)?:\\/\\/((([a-2H-9]{1,10})\\.)?1A\\.1C)/.16(g.L()));j(!x){2M(2N){H.D=H.D}}5!0}2O(e){}})},g.1E={Q:2(){5 g.d.1I("2W")[0]||g.d.1I("2X")[0]},1J:2(e,a){6 s=g.d.1a("32");s.1b="1c/1J",s.3t="3v",s.D=e,7.Q().3y(s);a&&g(s).v(a)},R:2(a,b){6 r=g.d.1a("1N");r.1b="1c/1O",r.1e=a,r.1f="1f",r.1R="1S-8";7.Q().1U(r,7.Q().1V);j(b&&B b==\'K\'){j(b.11){r.1X=b.11}j(b.G){g(r).v(b.G)}}}},g.3z=2(){j(!g(\'#1Z-20\').t){5}7.1E.R(1h.1i+"/24/R/25/26.R?v="+1h.27,{11:2(){28()}})},g.29={2a:2(){5(2(){6 s=[],V="2c";E(6 i=0;i<36;i++){s[i]=V.J(T.1L(T.1D()*2f),1)}s[14]="4";s[19]=V.J((s[19]&2i)|2j,1);s[8]=s[13]=s[18]=s[23]="-";5 s.1l("")})()},2l:2(b){6 a=b.t;b=2m(b).u(/\\=/g,"!");5 a+\'2o\'+b.2p(\'\').2q().2r(2(i,n){5 i===i.1n()?i.2u():i.1n()}).1l(\'\')},2v:2(a){6 b=A.C.X(a);6 c=A.C.X(";",b);5 b==-1?\'\':2y(A.C.2z(b+a.t+1,(c>b?c:A.C.t)))},2A:2(a,b,c,i){6 d=I Y();j(i){6 e=N(d.1q());6 f=(2E-d.1r()*2G-d.1s()*1t-d.1u());d.1v(e+2K*(f-d.2L()*1t*10));d="1w="+d.1x()+";"}1j{d=\'\'}c=c?"1y="+c+";":"";b=B b==\'K\'?1z.2P(b):b;A.C=Z(a)+"="+Z(b)+";"+d+c+" 1B=/"},2S:2(a,b){b=b?"1y="+b+";":"";6 c=I Y();c.1v(c.1q()-2T);A.C=Z(a)+"=1k;1w="+c.1x()+";"+b+" 1B=/"},2U:2(){6 a=l[0];E(6 i=1;i<l.t;i++){6 b=l[i];j(a.P().X(b)!=-1){5!0}}5!1}}})(z);15.O.2Z=2(){6 a=7.P();E(6 i=0;i<l.t;i++){6 b=l[i];a=a.u(\'%s\',b)}5 a};15.O.30=2(){6 a=7.P();j(!(B l==B l[0]&&B l[0]==\'K\')){1G"1H 33 34 35 37 a 1z .";}6 b=l.t;j(1!==b){1G"38 39,1H 3a l t 3b 1 .";}l=l[0];E(6 i U l){a=a.u(I F("{%"+i+"}","3d"),l[i])}5 a};15.O.3e=2(){5 7.P().u(/\\&/g,\'&3f;\').u(/\\"/g,\'&3g;\').u(/\\\'/g,\'‘\').u(/\\>/g,\'&3h;\').u(/</g,\'&3i;\').u(/\\n/g,\'<3j/>\').u(/\\[3k([0-9]*)\\]/g,\'<3l 1e="//1i.3m.1A.1C/3n/3o/$1.3p" 3q="0" />\')};Y.O.3r=2(a){6 o={"M+":7.1K()+1,"d+":7.3u(),"h+":7.1r(),"m+":7.1s(),"s+":7.1u(),"q+":T.1L((7.1K()+3)/3),"S":7.3w()};j(/(y+)/.16(a))a=a.u(F.$1,(7.3x()+"").J(4-F.$1.t));E(6 k U o)j(I F("("+k+")").16(a))a=a.u(F.$1,(F.$1.t==1)?(o[k]):(("21"+o[k]).J((""+o[k]).t)));5 a}', 62, 222, '||function|||return|var|this||||||||||||if||arguments||||||||length|replace|||||so|document|typeof|cookie|href|for|RegExp|attr|location|new|substr|object|nowUrl||parseInt|prototype|toString|outTag|js||Math|in|hexDigits|timeout|indexOf|Date|escape||callback|trim|||String|test|void|||createElement|type|text|window|src|async|layer|DOMAIN|cdn|else|null|join|parents|toUpperCase|undefined|val|getTime|getHours|getMinutes|60|getSeconds|setTime|expires|toGMTString|domain|JSON|sojson|path|com|random|insert|isNumber|throw|The|getElementsByTagName|css|getMonth|floor|eval|script|javascript|number|isNaN|charset|utf|NaN|insertBefore|firstChild|ewhile|onload|fn|ds|thread|00|msg||ui|message|ms|_v|loadMessage|utils|uuid|load|0123456789abcdef|setInterval|clearInterval|0x10|close|500|0x3|0x8|refresh|b64|btoa|dataById|OoO|split|reverse|map|idv|defaultV|toLowerCase|getCookie|_message|from|unescape|substring|setCookie|try|data|http|86400|id|3600|z0|ps|extend|1000000|getTimezoneOffset|while|true|catch|stringify|setTimeout|1000|delCookie|10000|contains|defn|head|body|cv|format|fmt|Function|link|parameter|types|must||be|syntax|error|desired|is|play|gm|filter|amp|quot|gt|lt|br|em_|img|www|images|emote|gif|border|Format|parent|rel|getDate|stylesheet|getMilliseconds|getFullYear|appendChild|batchMessage'.split('|'), 0, {}))('sojson.v4');

//窗口scroll
;!function() {

    var los = function(_self) {

        return function() {
            var main = _self.parent();

            var stop = $(window).scrollTop();

            //参数兼容
            var etop = _self.attr("etop") || 160;
            if ($(window).width() <= 750)
                return;
            var bottom = $('.footer-block').offset().top - $(window).height();
            if (stop > etop && stop < bottom) {
                if (!main.hasClass('site-fix')) {
                    main.addClass('site-fix');
                }
                if (main.hasClass('site-fix-footer')) {
                    main.removeClass('site-fix-footer');
                }
                _self.removeAttr('style');
            } else if (stop >= bottom) {

                // if(!main.hasClass('site-fix-footer')){
                //     main.addClass('site-fix site-fix-footer');
                // }
                _self.css("top", (((stop - bottom)) * -1) + "px");
            } else {
                if (main.hasClass('site-fix')) {
                    main.removeClass('site-fix').removeClass('site-fix-footer');
                }
            }
            stop = null;
        }
            ;
    };

    if ($('.auto-box').length) {
        $(window).on('scroll', los($('.auto-box')));
    }
    if ($('.site-tree').length) {
        $(window).on('scroll', los($('.site-tree')));
    }

}();
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "")
}
;
String.prototype.startWith = function(e) {
    return new RegExp("^" + e).test(this)
}
;
String.prototype.endWith = function(e) {
    return new RegExp(e + "$").test(this)
}
;
String.prototype.splitFirst = function(e) {
    var i = this.indexOf(e);
    if (i === -1) {
        return this;
    }
    return [this.slice(0, i), this.slice(i + 1), ];

}
