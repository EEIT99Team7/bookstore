package misc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = { "/*" }, 
		   initParams = { @WebInitParam(name = "noEncoding1", value = "/OrderConfirm.jsp"), }
)

public class EncodingFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();
			contextPath = req.getContextPath();
			requestURI = req.getRequestURI();
			if(noEncoding()) {
				chain.doFilter(request, response);
			}else {
				request.setCharacterEncoding("UTF-8");
				chain.doFilter(request, response);
			}

		}
	}

	private FilterConfig filterConfig;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		Enumeration<String> e = filterConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(filterConfig.getInitParameter(path));
		}
	}

	private boolean noEncoding() {
		boolean status = false;
		for (String sURL : url) {
			if (servletPath.equals(sURL)) {
				status = true;
				break;
			}
		}
		return status;
	}

	@Override
	public void destroy() {

	}
}
