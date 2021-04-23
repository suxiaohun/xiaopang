function log() {
    console.log(arguments);
}

var isMobile = navigator.userAgent.toLowerCase().match(/(ipod|iphone|android|coolpad|mmp|smartphone|midp|wap|xoom|symbian|j2me|blackberry|win ce)/i);
var ms = "\x62\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x3a \x72\x67\x62\x61\x28\x32\x35\x32\x2c\x32\x33\x34\x2c\x31\x38\x37\x2c\x31\x29\x3b\x62\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x3a \x2d\x6d\x6f\x7a\x2d\x6c\x69\x6e\x65\x61\x72\x2d\x67\x72\x61\x64\x69\x65\x6e\x74\x28\x6c\x65\x66\x74\x2c \x72\x67\x62\x61\x28\x32\x35\x32\x2c\x32\x33\x34\x2c\x31\x38\x37\x2c\x31\x29 \x30\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x35\x2c\x32\x35\x30\x2c\x37\x37\x2c\x31\x29 \x31\x32\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x34\x37\x2c\x34\x39\x2c\x31\x29 \x32\x38\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x31\x30\x2c\x32\x34\x37\x2c\x31\x29 \x33\x39\x25\x2c\x72\x67\x62\x61\x28\x30\x2c\x31\x38\x39\x2c\x32\x34\x37\x2c\x31\x29 \x35\x31\x25\x2c \x72\x67\x62\x61\x28\x31\x33\x33\x2c\x31\x30\x38\x2c\x32\x31\x37\x2c\x31\x29 \x36\x34\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x37\x2c\x30\x2c\x32\x34\x37\x2c\x31\x29 \x37\x38\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x37\x2c\x30\x2c\x31\x38\x39\x2c\x31\x29 \x38\x37\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x35\x2c\x32\x32\x2c\x35\x32\x2c\x31\x29 \x31\x30\x30\x25\x29\x3b\x62\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x3a \x2d\x77\x65\x62\x6b\x69\x74\x2d\x67\x72\x61\x64\x69\x65\x6e\x74\x28\x6c\x65\x66\x74 \x74\x6f\x70\x2c \x72\x69\x67\x68\x74 \x74\x6f\x70\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x30\x25\x2c \x72\x67\x62\x61\x28\x32\x35\x32\x2c\x32\x33\x34\x2c\x31\x38\x37\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x31\x32\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x35\x2c\x32\x35\x30\x2c\x37\x37\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x32\x38\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x34\x37\x2c\x34\x39\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x33\x39\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x31\x30\x2c\x32\x34\x37\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x35\x31\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x31\x38\x39\x2c\x32\x34\x37\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x36\x34\x25\x2c \x72\x67\x62\x61\x28\x31\x33\x33\x2c\x31\x30\x38\x2c\x32\x31\x37\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x37\x38\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x37\x2c\x30\x2c\x32\x34\x37\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x38\x37\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x37\x2c\x30\x2c\x31\x38\x39\x2c\x31\x29\x29\x2c \x63\x6f\x6c\x6f\x72\x2d\x73\x74\x6f\x70\x28\x31\x30\x30\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x35\x2c\x32\x32\x2c\x35\x32\x2c\x31\x29\x29\x29\x3b\x62\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x3a \x2d\x77\x65\x62\x6b\x69\x74\x2d\x6c\x69\x6e\x65\x61\x72\x2d\x67\x72\x61\x64\x69\x65\x6e\x74\x28\x6c\x65\x66\x74\x2c \x72\x67\x62\x61\x28\x32\x35\x32\x2c\x32\x33\x34\x2c\x31\x38\x37\x2c\x31\x29 \x30\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x35\x2c\x32\x35\x30\x2c\x37\x37\x2c\x31\x29 \x31\x32\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x34\x37\x2c\x34\x39\x2c\x31\x29 \x32\x38\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x31\x30\x2c\x32\x34\x37\x2c\x31\x29 \x33\x39\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x31\x38\x39\x2c\x32\x34\x37\x2c\x31\x29 \x35\x31\x25\x2c \x72\x67\x62\x61\x28\x31\x33\x33\x2c\x31\x30\x38\x2c\x32\x31\x37\x2c\x31\x29 \x36\x34\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x37\x2c\x30\x2c\x32\x34\x37\x2c\x31\x29 \x37\x38\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x37\x2c\x30\x2c\x31\x38\x39\x2c\x31\x29 \x38\x37\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x35\x2c\x32\x32\x2c\x35\x32\x2c\x31\x29 \x31\x30\x30\x25\x29\x3b\x62\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x3a \x2d\x6f\x2d\x6c\x69\x6e\x65\x61\x72\x2d\x67\x72\x61\x64\x69\x65\x6e\x74\x28\x6c\x65\x66\x74\x2c \x72\x67\x62\x61\x28\x32\x35\x32\x2c\x32\x33\x34\x2c\x31\x38\x37\x2c\x31\x29 \x30\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x35\x2c\x32\x35\x30\x2c\x37\x37\x2c\x31\x29 \x31\x32\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x34\x37\x2c\x34\x39\x2c\x31\x29 \x32\x38\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x31\x30\x2c\x32\x34\x37\x2c\x31\x29 \x33\x39\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x31\x38\x39\x2c\x32\x34\x37\x2c\x31\x29 \x35\x31\x25\x2c \x72\x67\x62\x61\x28\x31\x33\x33\x2c\x31\x30\x38\x2c\x32\x31\x37\x2c\x31\x29 \x36\x34\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x37\x2c\x30\x2c\x32\x34\x37\x2c\x31\x29 \x37\x38\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x37\x2c\x30\x2c\x31\x38\x39\x2c\x31\x29 \x38\x37\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x35\x2c\x32\x32\x2c\x35\x32\x2c\x31\x29 \x31\x30\x30\x25\x29\x3b\x62\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x3a \x2d\x6d\x73\x2d\x6c\x69\x6e\x65\x61\x72\x2d\x67\x72\x61\x64\x69\x65\x6e\x74\x28\x6c\x65\x66\x74\x2c \x72\x67\x62\x61\x28\x32\x35\x32\x2c\x32\x33\x34\x2c\x31\x38\x37\x2c\x31\x29 \x30\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x35\x2c\x32\x35\x30\x2c\x37\x37\x2c\x31\x29 \x31\x32\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x34\x37\x2c\x34\x39\x2c\x31\x29 \x32\x38\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x31\x30\x2c\x32\x34\x37\x2c\x31\x29 \x33\x39\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x31\x38\x39\x2c\x32\x34\x37\x2c\x31\x29 \x35\x31\x25\x2c \x72\x67\x62\x61\x28\x31\x33\x33\x2c\x31\x30\x38\x2c\x32\x31\x37\x2c\x31\x29 \x36\x34\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x37\x2c\x30\x2c\x32\x34\x37\x2c\x31\x29 \x37\x38\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x37\x2c\x30\x2c\x31\x38\x39\x2c\x31\x29 \x38\x37\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x35\x2c\x32\x32\x2c\x35\x32\x2c\x31\x29 \x31\x30\x30\x25\x29\x3b\x62\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x3a \x6c\x69\x6e\x65\x61\x72\x2d\x67\x72\x61\x64\x69\x65\x6e\x74\x28\x74\x6f \x72\x69\x67\x68\x74\x2c \x72\x67\x62\x61\x28\x32\x35\x32\x2c\x32\x33\x34\x2c\x31\x38\x37\x2c\x31\x29 \x30\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x35\x2c\x32\x35\x30\x2c\x37\x37\x2c\x31\x29 \x31\x32\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x34\x37\x2c\x34\x39\x2c\x31\x29 \x32\x38\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x32\x31\x30\x2c\x32\x34\x37\x2c\x31\x29 \x33\x39\x25\x2c \x72\x67\x62\x61\x28\x30\x2c\x31\x38\x39\x2c\x32\x34\x37\x2c\x31\x29 \x35\x31\x25\x2c \x72\x67\x62\x61\x28\x31\x33\x33\x2c\x31\x30\x38\x2c\x32\x31\x37\x2c\x31\x29 \x36\x34\x25\x2c \x72\x67\x62\x61\x28\x31\x37\x37\x2c\x30\x2c\x32\x34\x37\x2c\x31\x29 \x37\x38\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x37\x2c\x30\x2c\x31\x38\x39\x2c\x31\x29 \x38\x37\x25\x2c \x72\x67\x62\x61\x28\x32\x34\x35\x2c\x32\x32\x2c\x35\x32\x2c\x31\x29 \x31\x30\x30\x25\x29\x3b\x66\x69\x6c\x74\x65\x72\x3a \x70\x72\x6f\x67\x69\x64\x3a\x44\x58\x49\x6d\x61\x67\x65\x54\x72\x61\x6e\x73\x66\x6f\x72\x6d\x2e\x4d\x69\x63\x72\x6f\x73\x6f\x66\x74\x2e\x67\x72\x61\x64\x69\x65\x6e\x74\x28 \x73\x74\x61\x72\x74\x43\x6f\x6c\x6f\x72\x73\x74\x72\x3d\x27\x23\x66\x63\x65\x61\x62\x62\x27\x2c \x65\x6e\x64\x43\x6f\x6c\x6f\x72\x73\x74\x72\x3d\x27\x23\x66\x35\x31\x36\x33\x34\x27\x2c \x47\x72\x61\x64\x69\x65\x6e\x74\x54\x79\x70\x65\x3d\x31 \x29\x3b\x66\x6f\x6e\x74\x2d\x73\x69\x7a\x65\x3a\x31\x2e\x35\x65\x6d";
FileRetriever = function (e) {
    e = e || {},
        this.options = {
            maxSize: e.maxSize != void 0 ? e.maxSize : 1048576,
            html5: e.html5 != void 0 ? e.html5 : !0
        },
        this.timeout = Number(e.timeout) || 3e4,
        this.headers = {
            Accept: "application/json"
        },
        this.scriptUrl = e.scriptUrl || "fileretriever.php",
        this.notify = e.notify || void 0,
        this.defaultFilename = e.fileName || "document.json",
        this.dom = {}
};
FileRetriever.prototype._hide = function (e) {
    e.style.visibility = "hidden",
        e.style.position = "absolute",
        e.style.left = "-1000px",
        e.style.top = "-1000px",
        e.style.width = "0",
        e.style.height = "0"
},
    FileRetriever.prototype.remove = function () {
        var e = this.dom;
        for (var t in e) if (e.hasOwnProperty(t)) {
            var i = e[t]

            i.parentNode && i.parentNode.removeChild(i)
        }
        this.dom = {}
    },
    FileRetriever.prototype._getFilename = function (e) {
        return e ? e.replace(/^.*[\\\/]/, "") : ""
    },
    FileRetriever.prototype.setUrl = function (e) {
        this.url = e
    },
    FileRetriever.prototype.getFilename = function () {
        return this.defaultFilename
    },
    FileRetriever.prototype.getUrl = function () {
        return this.url
    },
    FileRetriever.prototype.loadUrl = function (e, t) {
        this.setUrl(e);
        var i = void 0;
        this.notify && (i = this.notify.showNotification("loading url..."));
        var o = this,
            n = function (e, n) {
                t && (t(e, n), t = void 0),
                o.notify && i && (o.notify.removeMessage(i), i = void 0)
            },
            s = this.scriptUrl;
        ajax.get(e, o.headers,
            function (t, i) {
                if (200 == i) n(null, t);
                else {
                    var r, a = s + "?url=" + encodeURIComponent(e);
                    ajax.get(a, o.headers,
                        function (t, i) {
                            200 == i ? n(null, t) : 404 == i ? (console.log('Error: url "' + e + '" not found', i, t), r = new Error('Error: url "' + e + '" not found'), n(r, null)) : (console.log('Error: failed to load url "' + e + '"', i, t), r = new Error('Error: failed to load url "' + e + '"'), n(r, null))
                        })
                }
            }),
            setTimeout(function () {
                    n(new Error("Error loading url (time out)"))
                },
                this.timeout)
    },
    FileRetriever.prototype.loadFile = function (e) {
        var t = void 0,
            i = this,
            o = function () {
                i.notify && !t && (t = i.notify.showNotification("loading file...")),
                    setTimeout(function () {
                            n(new Error("Error loading url (time out)"))
                        },
                        i.timeout)
            },
            n = function (o, n) {
                e && (e(o, n), e = void 0),
                i.notify && t && (i.notify.removeMessage(t), t = void 0)
            },
            s = "fileretriever-upload-" + Math.round(Math.random() * 1e15),
            r = document.createElement("iframe");
        r.name = s,
            i._hide(r),
            r.onload = function () {
                var e = r.contentWindow.document.body.innerHTML;
                if (e) {
                    var t = i.scriptUrl + "?id=" + e + "&filename=" + i.getFilename();
                    ajax.get(t, i.headers,
                        function (e, t) {
                            if (200 == t) n(null, e);
                            else {
                                var o = new Error("Error loading file " + i.getFilename());
                                n(o, null)
                            }
                        })
                }
            },
            document.body.appendChild(r);
        var a = navigator.appName == "Microsoft Internet Explorer";
        if (a) this.prompt({
            title: "Open file",
            titleSubmit: "Open",
            inputType: "file",
            inputName: "file",
            formAction: this.scriptUrl,
            formMethod: "POST",
            formTarget: s,
            callback: function (e) {
                e && o()
            }
        });
        else {
            var l = document.createElement("form");
            l.action = this.scriptUrl,
                l.method = "POST",
                l.enctype = "multipart/form-data",
                l.target = s,
                this._hide(l);
            var d = document.createElement("input");
            d.type = "file",
                d.name = "file",
                d.onchange = function () {
                    o(),
                        setTimeout(function () {
                                var e = d.value;
                                if (e.length) if (i.options.html5 && window.File && window.FileReader) {
                                    var t = d.files[0],
                                        o = new FileReader;
                                    o.onload = function (e) {
                                        var t = e.target.result;
                                        n(null, t)
                                    },
                                        o.readAsText(t)
                                } else l.submit();
                                else n(null, null)
                            },
                            0)
                },
                l.appendChild(d),
                document.body.appendChild(l),
                setTimeout(function () {
                        d.click()
                    },
                    0)
        }
    },
    FileRetriever.prototype.loadUrlDialog = function (e) {
        var t = this;
        this.prompt({
            title: "Open url",
            titleSubmit: "Open",
            inputType: "text",
            inputName: "url",
            inputDefault: this.getUrl(),
            callback: function (i) {
                i ? t.loadUrl(i, e) : e()
            }
        })
    },
    FileRetriever.prototype.prompt = function (e) {
        var t = function () {
                p.parentNode && p.parentNode.removeChild(p),
                n.parentNode && n.parentNode.removeChild(n),
                    jsoneditor.util.removeEventListener(document, "keydown", o)
            },
            i = function () {
                t(),
                e.callback && e.callback(null)
            },
            o = jsoneditor.util.addEventListener(document, "keydown",
                function (e) {
                    e = e || window.event;
                    var t = e.which || e.keyCode;
                    27 == t && (i(), jsoneditor.util.preventDefault(e), jsoneditor.util.stopPropagation(e))
                }),
            n = document.createElement("div");
        n.className = "fileretriever-overlay",
            document.body.appendChild(n);
        var s = document.createElement("form");
        s.className = "fileretriever-form",
            s.target = e.formTarget || "",
            s.action = e.formAction || "",
            s.method = e.formMethod || "POST",
            s.enctype = "multipart/form-data",
            s.encoding = "multipart/form-data",
            s.onsubmit = function () {
                return a.value ? (setTimeout(function () {
                        t()
                    },
                    0), e.callback && e.callback(a.value), e.formAction != void 0 && e.formMethod != void 0) : (alert("Enter a " + e.inputName + " first..."), !1)
            };
        var r = document.createElement("div");
        r.className = "fileretriever-title",
            r.appendChild(document.createTextNode(e.title || "Dialog")),
            s.appendChild(r);
        var a = document.createElement("input");
        a.className = "fileretriever-field",
            a.type = e.inputType || "text",
            a.name = e.inputName || "text",
            a.value = e.inputDefault || "";
        var l = document.createElement("div");
        l.className = "fileretriever-contents",
            l.appendChild(a),
            s.appendChild(l);
        var d = document.createElement("input");
        d.className = "fileretriever-cancel",
            d.type = "button",
            d.value = e.titleCancel || "Cancel",
            d.onclick = i;
        var h = document.createElement("input");
        h.className = "fileretriever-submit",
            h.type = "submit",
            h.value = e.titleSubmit || "Ok";
        var c = document.createElement("div");
        c.className = "fileretriever-buttons",
            c.appendChild(d),
            c.appendChild(h),
            s.appendChild(c);
        var u = document.createElement("div");
        u.className = "fileretriever-border",
            u.appendChild(s);
        var p = document.createElement("div");
        p.className = "fileretriever-background",
            p.appendChild(u),
            document.body.appendChild(p),
            a.focus(),
            a.select()
    },
    FileRetriever.prototype.saveFile = function (e, t) {
        var i = void 0;
        this.notify && (i = this.notify.showNotification("saving file..."));
        var o = this,
            n = function (e) {
                t && (t(e), t = void 0),
                o.notify && i && (o.notify.removeMessage(i), i = void 0)
            },
            s = document.createElement("a");
        this.options.html5 && s.download != void 0 ? (s.style.display = "none", s.href = "data:application/json;charset=utf-8," + encodeURIComponent(e), s.download = this.getFilename(), document.body.appendChild(s), s.click(), document.body.removeChild(s), n()) : e.length < this.options.maxSize ? ajax.post(o.scriptUrl, e, o.headers,
            function (e, t) {
                if (200 == t) {
                    var i = document.createElement("iframe");
                    i.src = o.scriptUrl + "?id=" + e + "&filename=" + o.getFilename(),
                        o._hide(i),
                        document.body.appendChild(i),
                        n()
                } else n(new Error("Error saving file"))
            }) : n(new Error("Maximum allowed file size exceeded (" + this.options.maxSize + " bytes)")),
            setTimeout(function () {
                    n(new Error("Error saving file (time out)"))
                },
                this.timeout)
    };






so.extend(so, {
    ua: {
        ua: navigator.userAgent.toLowerCase(),
        isMobile: isMobile,
        isSafari: function () {
            return this.ua.indexOf("safari") > -1 && this.ua.indexOf("chrome") === -1;
        },
        isChrome: function () {
            return this.ua.indexOf("chrome") > -1;
        }
    }
});


so.extend(so, {
    user: {
        isLogin: function (data) {
            if (data) {
                //没有登录，请登录
                if (data.login_status && data.login_status === 300) {
                    return layer.msg(data.message, so.defn), this.login(), !1;
                }
                return !0;
            }
            throw "data is undefined!";
        },
        vipLazy: function (bizType, fn) {

            so.post("/vip/lazy/load.shtml", {bizType}).done(function (d) {
                // d && d.status !== 403 ? (function (d,f) {
                //     return f(d);
                // })(d,fn) : (so.defn)(d);
                fn(d);
            });
        },
        checkEmail: function (data) {
            if (data) {
                //没有验证邮箱，请验证邮箱
                if (data.email_status && data.email_status === 300) {
                    layer.alert('如有消息回复，随时提醒您。', {icon: 1, btn: '去绑定', title: "请绑定邮箱"}, function (index) {
                        var form = so.d.createElement('form');
                        form.action = DOMAIN.admin + '/';
                        form.target = '_blank';
                        so(so.d.body).append(form);
                        form.submit();
                        layer.close(index);
                    });
                    return !1;
                }
                return !0;
            }
            throw "data is undefined!";
        },
        login: function () {
            var load = layer.load();
            //safari浏览器不兼容弹窗QQ登陆
            if (so.ua.isSafari()) {
                so.refresh(DOMAIN.www + '/user/open/relogin.shtml?redirect=' + encodeURIComponent(so.nowUrl()))
            } else {
                //noinspection JSAnnotator
                document.domain = 'sojson.com';
                so.post('/user/open/getQQUrl.shtml?' + Math.random()).done(function (i) {
                    layer.close(load);
                    var h = (so(so.w).height() - 480) / 0x2 - 20;
                    layer.open({
                        type: 1,
                        shadeClose: !0,
                        title: !1,
                        closeBtn: [0, !0],
                        shade: [0.8, '#000'],
                        offset: [h + 'px', ''],
                        area: ['630px', '380px'],
                        content: '<div style="width:630px;height:380px;overflow:hidden"><iframe frameborder="0"  scrolling="auto" src="' + i.url + '" width="100%" height="800"></iframe></div>',
                        end: function () {
                            loginBack();//用户自己关闭，调用回调方法。
                        }
                    });
                });
            }

        }
    }

});


layui.define(['element', 'table', 'util', 'Clipboard'], function (exports) {
    var element = layui.element
        , form = layui.form
        , util = layui.util
        , laytpl = layui.laytpl;

    so.w.layer = layui.layer;
    so.w.device = layui.device();
    so.w.Clipboard = layui.Clipboard;

    /*
     setTimeout(function () {
         var month = new Date().getMonth();

         if(!isMobile && month === 5 && so.utils.getCookie('aliyun2') !='1'){
             layer.confirm('本站报名了阿里云的活动😊，跪求点赞，其实就是为了赢台服务器，每人可以点赞一次，您也可以得到【代金券】😍，没账号用支付宝登录就可以了，😝站长跪谢😝',
                 {shade:false,title:'就顺手帮忙一下点个赞',btn: ['赏个脸，去点赞','狠心拒绝']},
                 function(index){
                     layer.msg('正在跳转阿里云... ...');
                     var form = so.d.createElement('form');
                     form.target = '_blank';
                     form.method = 'get';
                     form.action = 'https://www.aliyun.com/acts/hi618/delivery';
                     var input1 = so.d.createElement('input');
                     input1.type = 'hidden';
                     input1.name='storyId';
                     input1.value = '875592';
                     var input2 = so.d.createElement('input');
                     input2.type = 'hidden';
                     input2.name='userCode';
                     input2.value = 'lpbnxpc2';
                     $(form).append($(input1));
                     $(form).append($(input2));
                     so('body').append($(form));
                     $(form).submit();
                 },function(index){
                     so.utils.setCookie('aliyun2','1','.sojson.com',true);
                     layer.msg('bye!');
                     layer.close(index);
                 });
         }
     },1000);

     */


    //阻止IE7以下访问
    if (device.ie && device.ie < 9) {
        layer.alert('SOJSON 在ie9及以下，已经不能正常使用，您当前使用的是古老的 IE' + device.ie + '，请使用Chrome，Firefox！');
    }
    ;



    //监听提交
    form.on('submit(subCollect)', function (data) {
        var load = layer.load();
        so.post("/blogCollect/addCollect.shtml", data.field, function (result) {
            layer.close(load);
            if (result.status === 200) {
                layer.closeAll();
                layer.msg('收藏成功，请在“我的收藏”中查看。');
                loadCollectBox && loadCollectBox();
            } else {
                layer.msg(result.message || '添加失败。', so.defn);
            }
        });
        return !1;
    });
    //签到tab切换
    element.on('tab(sign_tab)', function (data) {
        if (data.index === 2) {
            so.post(DOMAIN.www + "/lazy/lotteryInfoList.shtml").done(function (data) {
                laytpl(out_lottery.innerHTML).render(data, function (html) {
                    so('[out_lottery]').html(html);
                    form.render();
                });
            });
        }
    });
    form.on('select(menu-select)', function (data) {
        data.value ? (function (d) {
            layer.load();
            so.refresh(DOMAIN.www + d);
        })(data.value) : void 0;
    });


    //收藏
    var collect = function (id, self) {

        var load = layer.load();
        so.post("/mytools/subCollect.shtml", {id: id}).done(function (re) {
            layer.close(load);
            if (so.user.isLogin(re)) {
                if (re.status == 200) {
                    so.each(so('[data-collect-id="' + id + '"]'), function (i, n) {
                        var target = so(n);
                        var br = target.hasClass('intro') ? '<br/>' : '';
                        if (re.type) {
                            so(this).html('<i class="iconfont icon-collect-checked"></i>{%br}取消收藏'.fmt({br: br})).addClass('checked');
                            so('[lay-type="bar4"] >i').v('class', 'iconfont icon-collect-checked');
                        } else {
                            so('[lay-type="bar4"] >i').v('class', 'iconfont icon-collect');
                            so(this).html('<i class="iconfont icon-collect"></i>{%br}加入收藏'.fmt({br: br})).removeClass('checked');
                        }
                    });
                    return layer.msg(re.message), !1;
                } else {
                    layer.msg(re.message, so.defn);
                }
            }
        });
    };
    so('body').on('click', '[data-collect-id]', function () {
        var self = so(this);
        var id = self.v('data-collect-id');
        if (self.hasClass('checked')) {
            layer.confirm('您取消收藏，是否要取消收藏？', {title: "收藏提醒"}, function (index) {
                layer.close(index);
                return collect(id, self);
            });
        } else {
            return collect(id, self);
        }
    });
    //签到
    so('body').on('click', '[sign]', function () {
        if (so(this).hasClass('layui-btn-disabled')) {
            return layer.msg('您已经签到。'), !1;
        }
        ;
        layer.msg('正在跳转签到 & 抽奖页面...');
        so.timeout(1, function () {
            location.href = DOMAIN.admin + "/admin/lottery/center.shtml";
        });
    });
    //签到排行
    so('body').on('click', '[sign_top]', function () {
        var load = layer.load();
        so.post(DOMAIN.www + "/lazy/signInfoList.shtml").done(function (data) {
            layer.close(load);
            laytpl(sign_html.innerHTML).render(data, function (html) {
                layer.open({
                    type: 1,
                    title: "签到排行榜",

                    content: html
                });
                form.render();
            });


        });
    });
    so('body').on('keyup', function (e) {
        e.keyCode === 27 && layer.closeAll();
    });

    //share
    var shareClip;
    so('body').on('mouseenter', '[click-type="share"]', function () {
        var self = so(this), text = self.v('text') + "#工具链接：" + so.nowUrl();
        text = text.replace(/#/g, "\n");
        self.v({"data-clipboard-text": text});
        shareClip = new Clipboard(this);
        shareClip.on('success', function () {
            layer.msg('已经复制成功，请粘贴分享给您的伙伴。');
        }).on('error', function () {
            layer.msg('复制失败', so.defn);
        });
    });

    var openX = function (html) {
        var openBox = so('[open-html-data="' + html + '"]');
        var data = so.parseJSON(openBox.v('open-data'));
        //before
        if (data.before) {
            eval(data.before + "(data)");
        }
        layer.open({
            type: 1,
            title: data.title,
            area: [data.w + 'px', data.h + "px"],
            content: openBox.html()
        });
        //end
        data.callback && eval(data.callback + "(data)");
    }
    //open window
    so('body').on('click', '[open-target]', function () {
        openX(so(this).v('open-target'));
    });

    so('body').on('click', '#control', function () {
        //宽度延展
        if ($(".linedwrap").length && $("#json_input").length) {
            $("#json_input").css({width: text_width, maxWidth: text_max_width});
        }
        var self = $(this);
        $('#so_box')[0].classList.toggle('is-active');
        self.find('i')[0].classList.toggle('icon-shouqi');
        self.find('i')[0].classList.toggle('icon-shouqi2');
        setTimeout(function () {
            //textarea 宽度计算
            var data = {};//兼容老版本
            if ($(".linedwrap").length) {
                $('div.grippie,#results').animate({"width": ($('div.grippie').prev()[0].offsetWidth)});

                var width = $(".linedwrap")[0].offsetWidth - $(".lines")[0].offsetWidth;
                data = {width: width, maxWidth: (width - 20)};
                $("#json_input").css(data);
            } else if ($('.sojson').length) {
                var w = $('.sojsonsaveFile').width();
                data = {width: w, maxWidth: w};
            }
            if (Object.getOwnPropertyNames(data).length) {
                //用户下次打开保证和上次的一致，新版首页应该用 1&0
                if (so('#pull').hasClass('icon-shouqi')) {
                    so.utils.setCookie('index-w', encodeURIComponent(JSON.stringify(data)), '.sojson.com', 1);
                    $("#so_box>.layui-tab>.layui-tab-title").css({width: "100%"});
                } else {
                    so.utils.delCookie("index-w", '.sojson.com');
                    $("#so_box>.layui-tab>.layui-tab-title").css({width: "76%"});
                }
            }

        }, 600);
    });
    //代码复制
    so.codeCopy = function () {
        so('[click-type="copycode"]').each(function () {
            var clipboard = new Clipboard(this.hasAttribute('id') ? '#' + this.id : this);
            clipboard.on('success', function (e) {
                layer.msg('复制成功');
            });
            clipboard.on('error', function (e) {
                layer.msg('复制失败');
            });
        });
    };
    so.codeCopy();


    var searchOutHtml = '<a href="{%url}"><div><h4 class="search_title layui-elip"><small>[{%typeName}]</small>&nbsp;&nbsp;{%highlight}</h4><p class="pl10 layui-elip">{%description}</p></div></a>';

    var globalSearch = function (kw, fn) {
        if (so.trim(kw) == '') {
            return layer.msg('请输入搜索词', so.defn), !1;
        }
        ;
        if (so.trim(kw).length == 1) {
            return layer.msg('关键词太短，我怎么找？', so.defn), !1;
        }
        ;
        var load = layer.load();
        so.post("/admin/search/goo.shtml?_=" + Math.random(), {kw: kw}, function (result) {
            layer.close(load);

            //输出
            if (result.status != 200) {
                layer.closeAll();
                return layer.msg(result.message || '没有找到内容。', so.defn), !1;
            }
            var html = [];
            var total = 0;
            if (result.list && result.list.length > 0) {

                so.each(result.list, function () {
                    this['typeName'] = this.type == 1 ? '工具类' : '博客类';
                    this['description'] = this.description.replace(new RegExp("<(/)?p>", "gm"), '');
                    html.push(searchOutHtml.fmt(this).replace(new RegExp("<(/)?code>", "gm"), ''));
                    total = this.total;
                });
                html = html.join('');
                so('[search_box]').html('<p total=""><small>一共找到&nbsp;' + total + ' 条结果，如果需要更精确，请多一些关键词。</small></p>' + html)
            } else {
                so('[search_box]').html('<p total=""><small>一共找到&nbsp;0 条结果，请更换关键词试试。</small></p>');
            }
            so('[search_box]').fadeIn(500);
            so('p[tips]').hide();
        });
        fn && fn();
    };


    //搜索框
    so('[selectContent]').on('keyup', function (e) {
        var v = so.trim(so(this).val());


        if (e.keyCode === 13 && v != '') {
            if (so.nowUrl().indexOf('/blog/') !== -1) {
                return location.href = '/blog/search.html?key=' + v;
            }
            layer.closeAll();
            globalSearch(v, function () {
                layer.open({
                    type: 1,
                    title: "搜索内容",
                    area: ['500px', 'auto;'],
                    content: so('[open-html-data="search-box"]').html()
                });
                so('.layui-layer-page .layui-layer-content').css({height: "auto", 'max-height': '450px'});
                so('.layui-layer-page').css('top', '160px');
            });
        }
    });
    so('#search_container icon-search').on('click', function () {
        so('[selectContent]').keyup();
    });

    so(document).on('click', '.layui-layer-shade', function () {
        layer.closeAll();
    });
    so('#clear').on('click', function () {
        var data = so(this).v('data-target');
        so(data).val('').empty().attr('value', '');
        if (typeof Vso === 'object') {
            Vso.editor.setValue("");
        }
    });



    //menu select
    so('li.layui-form dl > dd[lay-value]').on('click', function () {
        var self = $(this).attr('lay-value');
        layer.load();
        so.refresh(self);
    });


    exports('sojson', {});
});

so(function () {
    so("#saveFile").click(function () {

        var jsonVal = so.idv('json_input') || so(so(this).v('save-target')).val();
        if (typeof Vso === 'object') {
            jsonVal = Vso.editor.getValue();
        }
        if (undefined == jsonVal) {
            return layer.msg(so.msg(), so.defn), !1;
        }
        var fileName = 'sojson.com', selffileName = so(this).v('save-file-name');
        if (selffileName) {
            fileName = selffileName;
        }
        new FileRetriever({fileName: fileName + so(this).v('save-type')}).saveFile(jsonVal);

    });
    var qqlogin = function () {
    };
    so('#_login_').on('click', ".qqlogin", function () {
        so.user.login();
    });
    so('#_login_').on('click', ".logout", function () {
        logout();
    });
    /**下拉*/
    so('#_login_').on('mouseover', ".user-avatar", function () {
        so(this).next('div.layui-hide').removeClass('layui-hide');
    });
    so('#_login_').on('mouseout', ".user-avatar", function () {
        so(so.w).unbind('mouseout').on('mouseout', function (e) {
            if (!so('.user-block').is(e.target) && !so('.user-block').find(e.target).length) {
                so('.user-info').addClass('layui-hide');
            }
        });
    });
    so('#emessage').mouseover(function () {
        so('#messageBox.layui-hide').removeClass('layui-hide');
    });
    so('#emessage').mouseout(function (e) {
        so(so.w).unbind('mouseout').on('mouseout', function (e) {
            if (!so('.emessage').is(e.target) && !so('.emessage').find(e.target).length && !so('#messageBox').find(e.target).length) {
                so('#messageBox').addClass('layui-hide');
            }
        });
    });
    $('#search_container').on('mouseenter', function () {
        so(this).find('input').focus();
    });

    so(so.w).on('click', function () {
        so('#messageBox,#messageBox.layui-hide').addClass('layui-hide');
    });

});
(function (so, f, u) {
    if (document.title.indexOf("404—") === -1 && u.indexOf(".shtml") === -1) {

    }
    if ('off' !== so('[log-switch]').val() && window.console) {
        console.log("%c\u6211\u600E\u4E48\u90FD\u4E0D\u60F3\u7761\u3002\n\r\u5929\u7279\u522B\u7684\u4EAE\u591C\u7279\u522B\u7684\u9ED1\u3002\n\r\u5F53\u6211\u6DF1\u6DF1\u7684\u547C\u5438\u3002\n\r\u5FC3\u4E2D\u5145\u6EE1\u60F3\u4F60\u7684\u751C\u871C\u3002\n\r\u60F3\u548C\u4F60\u8D70\u5728\u96E8\u4E2D\u3002\n\r\u60F3\u8981\u4F60\u7275\u6211\u7684\u624B\u3002\n\r\u8FD9\u611F\u89C9\u8FD9\u4E00\u5207\u5C31\u597D\u50CF\u98D8\u5728\u5916\u592A\u7A7A\u3002\u53EA\u6709\u6211\u4EEC\u5B58\u5728\u3002 ", ms), console.log("%c\u2014\u52a0\u5165\u6211\u4eec\u5427\uff1aqq\u7fa4\uff1a259217951 \uff0c\u9a8c\u8bc1\u4fe1\u606f\uff1asojson.com\u3002", ms);
        console.log('--------------------------------------- | \u60A8\u6253\u5F00\u4E86\u63A7\u5236\u53F0\uFF0C\u8BF7\u4E0D\u8981\u5411\u6211\u70AB\u8000\u3002\u56E0\u4E3A\u5E76\u4E0D\u80FD\u4EE3\u8868\u4EC0\u4E48\uFF0C\u8FD9\u53EA\u662F\u73A9\u73A9\u800C\u5DF2\u3002 | --------------------------------------');
    }


})(so, so.from(), so.nowUrl());

export {}
