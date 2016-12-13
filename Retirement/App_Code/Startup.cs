using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Retirement.Startup))]
namespace Retirement
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
