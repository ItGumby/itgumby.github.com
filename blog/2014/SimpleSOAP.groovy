@Grab('org.springframework.ws:spring-ws-core:2.2.0.RELEASE')
@Grab('org.springframework.ws:spring-xml:2.2.0.RELEASE')

import org.springframework.ws.client.core.WebServiceTemplate
import org.springframework.ws.soap.client.core.SoapActionCallback
import org.springframework.ws.soap.saaj.SaajSoapMessageFactory
import org.springframework.xml.transform.StringSource

import groovy.util.slurpersupport.GPathResult
import groovy.util.XmlSlurper
import groovy.xml.MarkupBuilder

import java.text.SimpleDateFormat
import javax.xml.transform.stream.StreamResult

/* WSDL url:    http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL */
String buildRequest(String zip) {
    def writer = new StringWriter()
    def builder = new MarkupBuilder(writer)

    builder.GetCityForecastByZIP(xmlns: "http://ws.cdyne.com/WeatherWS/") {
        ZIP(zip)
    }
    return writer.toString()
}

String callSoapWeather(String body) {
    def msgFactory = new SaajSoapMessageFactory()
    msgFactory.afterPropertiesSet()

    def wsTemplate = new WebServiceTemplate(msgFactory)
    wsTemplate.setDefaultUri("http://wsf.cdyne.com/WeatherWS/Weather.asmx")

    def writer = new StringWriter()
    try {
        wsTemplate.sendSourceAndReceiveToResult(
            new StringSource(body),
            new SoapActionCallback("http://ws.cdyne.com/WeatherWS/GetCityForecastByZIP"),
            new StreamResult(writer)
        )
    } catch (Exception e) { println "ERROR: ${e.message} - ${e.cause}" }
    return writer.toString()
}

void printResults(String response) {
    final xml = new XmlSlurper().parseText(response)
    def nodes = xml.GetCityForecastByZIPResult
    println "Forecast for ${nodes.City}, ${nodes.State}"

    def format = new SimpleDateFormat("yyyy-MMM-dd")
    nodes.ForecastResult.children().each { forecast ->
        def inDate = new Date().parse("yyyy-MM-dd'T'HH:mm:ss", forecast.Date as String)
        println "${format.format(inDate)} ${forecast.Description} ${forecast.Temperatures.MorningLow} - ${forecast.Temperatures.DaytimeHigh}"
    }
}

final zips = args ? args : ["94304"]
zips.each {
    println "Requesting forecast for ${it}"
    def req = buildRequest(it)
    def resp = callSoapWeather(req)
    printResults(resp)
    println "\n"
}
