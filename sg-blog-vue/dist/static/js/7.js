webpackJsonp([7],{"YR+K":function(s,a){},psK5:function(s,a,t){"use strict";Object.defineProperty(a,"__esModule",{value:!0});var e=t("Cz8s"),i=t("vMJZ"),r=t("IcnI"),n={name:"UserInfo",data:function(){return{uploadURL:"",isEdit:!1,userInfo:{},userInfoObj:"",imgUrl:""}},methods:{handleAvatarSuccess:function(s,a){200==s.code?(this.userInfoObj.avatar=s.data,this.imgUrl=r.a.state.baseURL+"download?name="+s.data,this.userInfoObj.head_start=1):this.$message.error("上传图片失败")},beforeAvatarUpload:function(s){var a="image/png"==s.type||"image/jpg"==s.type||"image/jpeg"==s.type,t=s.size/1024/1024<1;return a||this.$message.error("上传头像图片只能是 JPG/JPEG/PNG 格式!"),t||this.$message.error("上传头像图片大小不能超过 1MB!"),a&&t},saveInfoFun:function(){var s=this;s.userInfoObj.nickName?Object(i.c)(s.userInfoObj).then(function(a){s.$message.success("保存成功！"),s.isEdit=!1,s.routeChange()}):s.$message.error("昵称为必填项，请填写昵称")},routeChange:function(){var s=this;localStorage.getItem("userInfo")?(s.haslogin=!0,s.userInfo=JSON.parse(localStorage.getItem("userInfo")),s.userId=s.userInfo.id,Object(i.a)(s.userId).then(function(a){s.userInfoObj=a,s.userInfoObj.head_start=0,s.imgUrl=r.a.state.baseURL+"download?name="+s.userInfoObj.avatar})):s.haslogin=!1}},components:{"wbc-nav":e.a},watch:{$route:"routeChange"},created:function(){this.routeChange(),this.uploadURL=r.a.state.baseURL+"upload"}},o={render:function(){var s=this,a=s.$createElement,t=s._self._c||a;return t("div",[t("wbc-nav"),s._v(" "),t("div",{staticClass:"container"},[t("div",{directives:[{name:"show",rawName:"v-show",value:s.isEdit,expression:"isEdit"}],staticClass:"tcommonBox"},[s._m(0),s._v(" "),t("section",[t("ul",{staticClass:"userInfoBox"},[t("li",{staticClass:"avatarlist"},[t("span",{staticClass:"leftTitle"},[s._v("头像")]),s._v(" "),t("el-upload",{staticClass:"avatar-uploader",attrs:{headers:"Content-Type: multipart/form-data",action:s.uploadURL,"show-file-list":!1,"on-success":s.handleAvatarSuccess,"before-upload":s.beforeAvatarUpload}},[s.imgUrl?t("img",{staticClass:"avatar",attrs:{src:s.imgUrl?s.imgUrl:"static/img/tou.jpg",alt:s.$store.state.errorImg,onerror:s.$store.state.errorImg}}):t("i",{staticClass:"el-icon-plus avatar-uploader-icon"}),s._v(" "),t("div",{staticClass:"el-upload__tip",attrs:{slot:"tip"},slot:"tip"},[s._v("点击上传头像，只能上传jpg/png文件，且不超过1mb")])])],1),s._v(" "),t("li",{staticClass:"username"},[t("span",{staticClass:"leftTitle"},[s._v("昵称")]),s._v(" "),t("el-input",{attrs:{placeholder:"昵称"},model:{value:s.userInfoObj.nickName,callback:function(a){s.$set(s.userInfoObj,"nickName",a)},expression:"userInfoObj.nickName"}}),s._v(" "),t("i",{staticClass:"fa fa-wa fa-asterisk"})],1),s._v(" "),t("li",[t("span",{staticClass:"leftTitle"},[s._v("电子邮件")]),s._v(" "),t("span",[s._v(s._s(s.userInfoObj.email))])]),s._v(" "),t("li",[t("span",{staticClass:"leftTitle"},[s._v("性别")]),s._v(" "),[t("el-radio",{staticClass:"radio",attrs:{label:"0"},model:{value:s.userInfoObj.sex,callback:function(a){s.$set(s.userInfoObj,"sex",a)},expression:"userInfoObj.sex"}},[s._v("男")]),s._v(" "),t("el-radio",{staticClass:"radio",attrs:{label:"1"},model:{value:s.userInfoObj.sex,callback:function(a){s.$set(s.userInfoObj,"sex",a)},expression:"userInfoObj.sex"}},[s._v("女")])]],2)]),s._v(" "),t("div",{staticClass:" saveInfobtn"},[t("a",{staticClass:"tcolors-bg",attrs:{href:"javascript:void(0);"},on:{click:function(a){s.isEdit=!s.isEdit}}},[s._v("返 回")]),s._v(" "),t("a",{staticClass:"tcolors-bg",attrs:{href:"javascript:void(0);"},on:{click:s.saveInfoFun}},[s._v("保 存")])])])]),s._v(" "),t("div",{directives:[{name:"show",rawName:"v-show",value:!s.isEdit,expression:"!isEdit"}],staticClass:"tcommonBox"},[t("header",[t("h1",[s._v("\n                        个人中心\n                    "),t("span",{staticClass:"gotoEdit",on:{click:function(a){s.isEdit=!s.isEdit}}},[t("i",{staticClass:"fa fa-wa fa-edit"}),s._v("编辑")])])]),s._v(" "),t("section",[t("ul",{staticClass:"userInfoBox"},[t("li",{staticClass:"avatarlist"},[t("span",{staticClass:"leftTitle"},[s._v("头像")]),s._v(" "),t("div",{staticClass:"avatar-uploader"},[t("img",{staticClass:"avatar",attrs:{src:s.imgUrl?s.imgUrl:"static/img/tou.jpg",alt:s.$store.state.errorImg,onerror:s.$store.state.errorImg}})])]),s._v(" "),t("li",{staticClass:"username"},[t("span",{staticClass:"leftTitle"},[s._v("昵称")]),s._v(" "),t("span",[s._v(s._s(s.userInfoObj.nickName?s.userInfoObj.nickName:"无"))])]),s._v(" "),t("li",[t("span",{staticClass:"leftTitle"},[s._v("电子邮件")]),s._v(" "),t("span",[s._v(s._s(s.userInfoObj.email?s.userInfoObj.email:"无"))])]),s._v(" "),t("li",[t("span",{staticClass:"leftTitle"},[s._v("性别")]),s._v(" "),t("span",[s._v(s._s(0==s.userInfoObj.sex?"男":"女"))])])])])])])],1)},staticRenderFns:[function(){var s=this.$createElement,a=this._self._c||s;return a("header",[a("h1",[this._v("\n                        编辑个人资料\n                ")])])}]};var l=t("VU/8")(n,o,!1,function(s){t("YR+K")},null,null);a.default=l.exports}});