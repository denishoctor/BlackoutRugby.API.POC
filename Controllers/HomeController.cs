using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BlackoutRugbyPOC.Controllers;

namespace BlackoutRugby.API.POC2.Controllers {
    [HandleError]
    public class HomeController : Controller {
        public ActionResult Index() {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(string requestParams, string devKey, string devIV, string devID) {
            ViewData["ApiRequest"] = "http://api.blackoutrugby.com/?d=" + devID + "&dk=" + devKey + requestParams;
            ViewData["ApiResponse"] = BlackoutRugbyAPI.Request(requestParams, devKey, devIV, devID);

            return View("Show");
        }
    }
}
