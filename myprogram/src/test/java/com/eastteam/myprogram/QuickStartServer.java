package com.eastteam.myprogram;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;

/**
 * 使用Jetty运行调试Web应用, 在Console输入回车快速重新加载应用.
 * 
 * @author calvin
 */
public class QuickStartServer {

	public static final int PORT = 8088;
	public static final String CONTEXT = "/myprogram";
	public static final String[] TLD_JAR_NAMES = new String[] { "sitemesh", "spring-webmvc", "shiro-web",
			"springside-core" };

	public static void main(String[] args) throws Exception {
		// 设定Spring的profile
		Profiles.setProfileAsSystemProperty(Profiles.UNIT_TEST);

		// 启动Jetty
		Server server = JettyFactory.createServerInSource(PORT, CONTEXT);
		 WebAppContext webContext = new WebAppContext("WebContent", "/");
         webContext.setClassLoader(Thread.currentThread().getContextClassLoader());
         server.setHandler(webContext);
		JettyFactory.setTldJarNames(server, TLD_JAR_NAMES);

		try {
			server.start();

			System.out.println("[INFO] Server running at http://localhost:" + PORT + CONTEXT);
			System.out.println("[HINT] Hit Enter to reload the application quickly");

			// 等待用户输入回车重载应用.
			while (true) {
				char c = (char) System.in.read();
				if (c == '\n') {
					JettyFactory.reloadContext(server);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}
	}
}
