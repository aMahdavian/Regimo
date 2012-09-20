package au.com.regimo.web;

import java.util.Collection;
import java.util.Set;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import au.com.regimo.core.service.SecurityService;

import com.google.common.collect.Lists;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private RequestMappingHandlerMapping requestMappingHandlerMapping;

	private SecurityService securityService;

	@RequestMapping(value="endpoints", method = RequestMethod.GET)
	public void getEndPoints(Model model,
			@RequestParam(required=false, defaultValue="false") Boolean reload) {
		if(reload) securityService.loadUrls();
		Set<RequestMappingInfo> mappings = requestMappingHandlerMapping.getHandlerMethods().keySet();
		Collection<String> authorities = Lists.newArrayListWithCapacity(mappings.size());
		for(RequestMappingInfo mapping : mappings){
			authorities.add(securityService.getAuthority(
				StringUtils.substringBetween(mapping.getPatternsCondition().getPatterns().toString(),"[","]"),
				StringUtils.substringBetween(mapping.getMethodsCondition().getMethods().toString(),"[","]")));
		}

	    model.addAttribute("endpoints", mappings);
	    model.addAttribute("authorities", authorities.toArray());
	}

	@Inject
	@Qualifier("org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping#0")
	public void setRequestMappingHandlerMapping(
			RequestMappingHandlerMapping requestMappingHandlerMapping) {
		this.requestMappingHandlerMapping = requestMappingHandlerMapping;
	}

	@Inject
	public void setSecurityService(SecurityService securityService) {
		this.securityService = securityService;
	}

}
