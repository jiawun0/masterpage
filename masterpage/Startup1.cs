using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;

[assembly: OwinStartup(typeof(masterpage.Startup1))]

namespace masterpage
{
    public class Startup1
    {
        public void Configuration(IAppBuilder app)
        {
            // 如需如何設定應用程式的詳細資訊，請瀏覽 https://go.microsoft.com/fwlink/?LinkID=316888
            //跟 MVC Router 一樣讓別人知道 SignalR 的位置
            app.MapSignalR();
        }
    }
}
