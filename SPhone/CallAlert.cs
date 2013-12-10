using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using System.Collections.Concurrent;

namespace SPhone
{
    public class CallAlert : Hub
    {

        static ConcurrentDictionary<string, string> dic = new ConcurrentDictionary<string, string>();

        public void Notify(string id, string name)
        {
            dic.TryAdd(name, id);
        }
        public  void CallerName(string name)
        {
          //  var context = GlobalHost.ConnectionManager.GetHubContext<CallAlert>();
           // context.Clients.Client(name).cname(name);
            Clients.All.cname(name);
           // Clients.Others.cname(name);
           // Clients.All.cname(name);
           // dic.TryAdd(name, "123");
           // Clients.Client(name).cname(name);
        }
    }
}