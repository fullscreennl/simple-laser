<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="100" name="Muster" color="7" fill="1" visible="no" active="no"/>
<layer number="101" name="Patch_Top" color="12" fill="4" visible="no" active="yes"/>
<layer number="102" name="Vscore" color="7" fill="1" visible="no" active="yes"/>
<layer number="103" name="tMap" color="7" fill="1" visible="no" active="yes"/>
<layer number="104" name="Name" color="16" fill="1" visible="no" active="yes"/>
<layer number="105" name="tPlate" color="7" fill="1" visible="no" active="yes"/>
<layer number="106" name="bPlate" color="7" fill="1" visible="no" active="yes"/>
<layer number="107" name="Crop" color="7" fill="1" visible="no" active="yes"/>
<layer number="116" name="Patch_BOT" color="9" fill="4" visible="no" active="yes"/>
<layer number="121" name="_tsilk" color="7" fill="1" visible="no" active="yes"/>
<layer number="122" name="_bsilk" color="7" fill="1" visible="no" active="yes"/>
<layer number="125" name="_tNames" color="7" fill="1" visible="no" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="no" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="no" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="yes"/>
<layer number="201" name="201bmp" color="2" fill="10" visible="no" active="yes"/>
<layer number="202" name="202bmp" color="3" fill="10" visible="no" active="yes"/>
<layer number="203" name="203bmp" color="4" fill="10" visible="no" active="yes"/>
<layer number="204" name="204bmp" color="5" fill="10" visible="no" active="yes"/>
<layer number="205" name="205bmp" color="6" fill="10" visible="no" active="yes"/>
<layer number="206" name="206bmp" color="7" fill="10" visible="no" active="yes"/>
<layer number="207" name="207bmp" color="8" fill="10" visible="no" active="yes"/>
<layer number="208" name="208bmp" color="9" fill="10" visible="no" active="yes"/>
<layer number="209" name="209bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="210" name="210bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="211" name="211bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="212" name="212bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="213" name="213bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="214" name="214bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="215" name="215bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="216" name="216bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="217" name="217bmp" color="18" fill="1" visible="no" active="no"/>
<layer number="218" name="218bmp" color="19" fill="1" visible="no" active="no"/>
<layer number="219" name="219bmp" color="20" fill="1" visible="no" active="no"/>
<layer number="220" name="220bmp" color="21" fill="1" visible="no" active="no"/>
<layer number="221" name="221bmp" color="22" fill="1" visible="no" active="no"/>
<layer number="222" name="222bmp" color="23" fill="1" visible="no" active="no"/>
<layer number="223" name="223bmp" color="24" fill="1" visible="no" active="no"/>
<layer number="224" name="224bmp" color="25" fill="1" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
<layer number="254" name="cooling" color="7" fill="1" visible="no" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="SparkFun">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
We've spent an enormous amount of time creating and checking these footprints and parts. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; CC v3.0 Share-Alike You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="TSSOP20">
<wire x1="-2.2922" y1="-3.8487" x2="2.2602" y2="-3.8487" width="0.127" layer="51"/>
<wire x1="2.2602" y1="-3.8487" x2="2.2602" y2="3.2908" width="0.127" layer="51"/>
<wire x1="2.2602" y1="3.2908" x2="-2.2922" y2="3.2908" width="0.127" layer="51"/>
<wire x1="-2.2922" y1="3.2908" x2="-2.2922" y2="-3.8487" width="0.127" layer="51"/>
<wire x1="-2.2922" y1="3.2908" x2="2.2602" y2="3.2908" width="0.127" layer="21"/>
<wire x1="2.2602" y1="3.2908" x2="2.2602" y2="-3.8487" width="0.127" layer="21"/>
<wire x1="2.2602" y1="-3.8487" x2="-2.2922" y2="-3.8487" width="0.127" layer="21"/>
<wire x1="-2.2922" y1="-3.8487" x2="-2.2922" y2="3.2908" width="0.127" layer="21"/>
<circle x="-1.716" y="2.7908" radius="0.1414" width="0.05" layer="21"/>
<smd name="10" x="-2.937" y="-3.2508" dx="1" dy="0.4" layer="1"/>
<smd name="9" x="-2.937" y="-2.5904" dx="1" dy="0.4" layer="1"/>
<smd name="8" x="-2.943" y="-1.93" dx="1" dy="0.4" layer="1"/>
<smd name="7" x="-2.937" y="-1.2696" dx="1" dy="0.4" layer="1"/>
<smd name="6" x="-2.937" y="-0.6092" dx="1" dy="0.4" layer="1"/>
<smd name="5" x="-2.937" y="0.0512" dx="1" dy="0.4" layer="1"/>
<smd name="4" x="-2.937" y="0.7116" dx="1" dy="0.4" layer="1"/>
<smd name="3" x="-2.937" y="1.372" dx="1" dy="0.4" layer="1"/>
<smd name="2" x="-2.937" y="2.0324" dx="1" dy="0.4" layer="1"/>
<smd name="1" x="-2.937" y="2.6928" dx="1" dy="0.4" layer="1"/>
<smd name="20" x="2.905" y="2.6928" dx="1" dy="0.4" layer="1"/>
<smd name="19" x="2.905" y="2.0324" dx="1" dy="0.4" layer="1"/>
<smd name="18" x="2.905" y="1.372" dx="1" dy="0.4" layer="1"/>
<smd name="17" x="2.905" y="0.7116" dx="1" dy="0.4" layer="1"/>
<smd name="16" x="2.905" y="0.0512" dx="1" dy="0.4" layer="1"/>
<smd name="15" x="2.905" y="-0.6092" dx="1" dy="0.4" layer="1"/>
<smd name="14" x="2.905" y="-1.2696" dx="1" dy="0.4" layer="1"/>
<smd name="13" x="2.911" y="-1.93" dx="1" dy="0.4" layer="1"/>
<smd name="12" x="2.905" y="-2.5904" dx="1" dy="0.4" layer="1"/>
<smd name="11" x="2.905" y="-3.2508" dx="1" dy="0.4" layer="1"/>
<text x="-2.116" y="3.4908" size="0.254" layer="25">&gt;Name</text>
<text x="-2.116" y="-4.2396" size="0.254" layer="27">&gt;Value</text>
</package>
</packages>
<symbols>
<symbol name="AD7302">
<wire x1="-10.16" y1="12.7" x2="-10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-15.24" x2="10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="12.7" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<text x="-2.54" y="15.24" size="1.778" layer="95" rot="R180">&gt;Name</text>
<text x="-10.16" y="-17.78" size="1.778" layer="96">&gt;Value</text>
<pin name="DB7" x="-15.24" y="10.16" length="middle"/>
<pin name="DB6" x="-15.24" y="7.62" length="middle"/>
<pin name="DB5" x="-15.24" y="5.08" length="middle"/>
<pin name="DB4" x="-15.24" y="2.54" length="middle"/>
<pin name="DB3" x="-15.24" y="0" length="middle"/>
<pin name="DB2" x="-15.24" y="-2.54" length="middle"/>
<pin name="DB1" x="-15.24" y="-5.08" length="middle"/>
<pin name="DB0" x="-15.24" y="-7.62" length="middle"/>
<pin name="CS" x="-15.24" y="-10.16" length="middle"/>
<pin name="WR" x="-15.24" y="-12.7" length="middle"/>
<pin name="DGND" x="15.24" y="10.16" length="middle" rot="R180"/>
<pin name="VOUTA" x="15.24" y="7.62" length="middle" rot="R180"/>
<pin name="VOUTB" x="15.24" y="5.08" length="middle" rot="R180"/>
<pin name="AGND" x="15.24" y="2.54" length="middle" rot="R180"/>
<pin name="REFIN" x="15.24" y="0" length="middle" rot="R180"/>
<pin name="VDD" x="15.24" y="-2.54" length="middle" rot="R180"/>
<pin name="CLR" x="15.24" y="-5.08" length="middle" rot="R180"/>
<pin name="LDAC" x="15.24" y="-7.62" length="middle" rot="R180"/>
<pin name="PD" x="15.24" y="-10.16" length="middle" rot="R180"/>
<pin name="AB" x="15.24" y="-12.7" length="middle" rot="R180"/>
</symbol>
<symbol name="5V">
<wire x1="0.762" y1="1.27" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-0.762" y2="1.27" width="0.254" layer="94"/>
<text x="-1.016" y="3.556" size="1.778" layer="96">&gt;VALUE</text>
<pin name="5V" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="3.3V">
<wire x1="0.762" y1="1.27" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-0.762" y2="1.27" width="0.254" layer="94"/>
<text x="-1.016" y="3.556" size="1.778" layer="96">&gt;VALUE</text>
<pin name="3.3V" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AD7302">
<description>AD7302</description>
<gates>
<gate name="G$1" symbol="AD7302" x="0" y="0"/>
</gates>
<devices>
<device name="SMD" package="TSSOP20">
<connects>
<connect gate="G$1" pin="AB" pad="11"/>
<connect gate="G$1" pin="AGND" pad="17"/>
<connect gate="G$1" pin="CLR" pad="14"/>
<connect gate="G$1" pin="CS" pad="9"/>
<connect gate="G$1" pin="DB0" pad="8"/>
<connect gate="G$1" pin="DB1" pad="7"/>
<connect gate="G$1" pin="DB2" pad="6"/>
<connect gate="G$1" pin="DB3" pad="5"/>
<connect gate="G$1" pin="DB4" pad="4"/>
<connect gate="G$1" pin="DB5" pad="3"/>
<connect gate="G$1" pin="DB6" pad="2"/>
<connect gate="G$1" pin="DB7" pad="1"/>
<connect gate="G$1" pin="DGND" pad="20"/>
<connect gate="G$1" pin="LDAC" pad="13"/>
<connect gate="G$1" pin="PD" pad="12"/>
<connect gate="G$1" pin="REFIN" pad="16"/>
<connect gate="G$1" pin="VDD" pad="15"/>
<connect gate="G$1" pin="VOUTA" pad="19"/>
<connect gate="G$1" pin="VOUTB" pad="18"/>
<connect gate="G$1" pin="WR" pad="10"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="5V">
<gates>
<gate name="G$1" symbol="5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="3.3V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="3.3V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="RaspberryPi">
<packages>
<package name="RASPBERRY-PI">
<wire x1="82.6" y1="5.275" x2="-2.4" y2="5.275" width="0.127" layer="51"/>
<wire x1="-2.4" y1="5.275" x2="-2.4" y2="-6.225" width="0.127" layer="51"/>
<wire x1="-2.4" y1="-34.025" x2="-2.4" y2="-50.725" width="0.127" layer="51"/>
<wire x1="-2.4" y1="-50.725" x2="82.6" y2="-50.725" width="0.127" layer="51"/>
<wire x1="82.6" y1="-50.725" x2="82.6" y2="5.275" width="0.127" layer="51"/>
<wire x1="-0.925" y1="0.925" x2="0.925" y2="0.925" width="0.127" layer="21"/>
<wire x1="0.925" y1="0.925" x2="0.925" y2="-0.925" width="0.127" layer="21" curve="1.965897"/>
<wire x1="0.925" y1="-0.925" x2="-0.925" y2="-0.925" width="0.127" layer="21"/>
<wire x1="-0.925" y1="-0.925" x2="-0.925" y2="0.925" width="0.127" layer="21"/>
<wire x1="-2.4" y1="-6.225" x2="16.6" y2="-6.225" width="0.127" layer="51"/>
<wire x1="16.6" y1="-6.225" x2="16.6" y2="-34.025" width="0.127" layer="51"/>
<wire x1="16.6" y1="-34.025" x2="-2.4" y2="-34.025" width="0.127" layer="51"/>
<wire x1="-2.4" y1="-34.025" x2="-2.4" y2="-6.225" width="0.127" layer="51"/>
<wire x1="73.1" y1="-13.525" x2="90.3" y2="-13.525" width="0.127" layer="51"/>
<wire x1="90.3" y1="-13.525" x2="90.3" y2="-26.775" width="0.127" layer="51"/>
<wire x1="90.3" y1="-26.775" x2="73.1" y2="-26.775" width="0.127" layer="51"/>
<wire x1="73.1" y1="-26.775" x2="73.1" y2="-13.525" width="0.127" layer="51"/>
<wire x1="61.8" y1="-48.725" x2="83.6" y2="-48.725" width="0.127" layer="51"/>
<wire x1="83.6" y1="-48.725" x2="83.6" y2="-33.325" width="0.127" layer="51"/>
<wire x1="83.6" y1="-33.325" x2="61.8" y2="-33.325" width="0.127" layer="51"/>
<wire x1="61.8" y1="-33.325" x2="61.8" y2="-48.725" width="0.127" layer="51"/>
<wire x1="2.7" y1="-47.1" x2="-2.9" y2="-47.1" width="0.127" layer="51"/>
<wire x1="-2.9" y1="-47.1" x2="-2.9" y2="-39.5" width="0.127" layer="51"/>
<wire x1="-2.9" y1="-39.5" x2="2.7" y2="-39.5" width="0.127" layer="51"/>
<wire x1="2.7" y1="-39.5" x2="2.7" y2="-47.1" width="0.127" layer="51"/>
<wire x1="-1.4" y1="-1.225" x2="31.8" y2="-1.225" width="0.127" layer="21"/>
<wire x1="31.8" y1="-1.225" x2="31.8" y2="3.775" width="0.127" layer="21"/>
<wire x1="31.8" y1="3.775" x2="-1.4" y2="3.775" width="0.127" layer="21"/>
<wire x1="-1.4" y1="3.775" x2="-1.4" y2="-1.225" width="0.127" layer="21"/>
<wire x1="-2.4" y1="-6.225" x2="-17.4" y2="-6.225" width="0.05" layer="51"/>
<wire x1="-17.4" y1="-6.225" x2="-17.4" y2="-34.025" width="0.05" layer="51"/>
<wire x1="-17.4" y1="-34.025" x2="-2.3" y2="-34.025" width="0.05" layer="51"/>
<wire x1="-2.3" y1="-34.025" x2="-2.3" y2="-34.125" width="0.05" layer="51"/>
<wire x1="38.61" y1="3.16" x2="38.61" y2="11.46" width="0.127" layer="51"/>
<wire x1="38.61" y1="11.46" x2="47.51" y2="11.36" width="0.127" layer="51"/>
<wire x1="47.51" y1="11.36" x2="47.51" y2="3.06" width="0.127" layer="51"/>
<wire x1="47.51" y1="3.06" x2="38.22" y2="3.16" width="0.127" layer="51"/>
<wire x1="38.17" y1="-6.85" x2="47.97" y2="-6.95" width="0.127" layer="51"/>
<wire x1="47.97" y1="-6.95" x2="47.97" y2="3.05" width="0.127" layer="51"/>
<wire x1="47.97" y1="3.05" x2="38.17" y2="3.15" width="0.127" layer="51"/>
<wire x1="38.17" y1="3.15" x2="38.17" y2="-6.85" width="0.127" layer="51"/>
<wire x1="68.6" y1="5.3" x2="68.6" y2="-6.1" width="0.127" layer="51"/>
<wire x1="68.6" y1="-6.1" x2="56.6" y2="-6.1" width="0.127" layer="51"/>
<wire x1="56.6" y1="-6.1" x2="56.6" y2="5.3" width="0.127" layer="51"/>
<wire x1="65.9" y1="5.3" x2="66" y2="5.3" width="0.127" layer="51"/>
<wire x1="66" y1="5.3" x2="66" y2="8.9" width="0.127" layer="51"/>
<wire x1="66" y1="8.9" x2="59.4" y2="8.9" width="0.127" layer="51"/>
<wire x1="59.4" y1="8.9" x2="59.4" y2="5.3" width="0.127" layer="51"/>
<wire x1="35.1" y1="-51.9" x2="50.2" y2="-51.9" width="0.127" layer="51"/>
<wire x1="50.2" y1="-51.9" x2="50.2" y2="-40.5" width="0.127" layer="51"/>
<wire x1="50.2" y1="-40.5" x2="35.1" y2="-40.5" width="0.127" layer="51"/>
<wire x1="35.1" y1="-40.5" x2="35.1" y2="-51.9" width="0.127" layer="51"/>
<circle x="0.078" y="3.0996" radius="1.0152" width="0.1524" layer="52"/>
<circle x="5.158" y="3.0996" radius="1.0152" width="0.1524" layer="52"/>
<pad name="1" x="0" y="0" drill="1" shape="square"/>
<pad name="2" x="0" y="2.54" drill="1" diameter="1.6764"/>
<pad name="3" x="2.54" y="0" drill="1"/>
<pad name="4" x="2.54" y="2.54" drill="1"/>
<pad name="5" x="5.08" y="0" drill="1"/>
<pad name="6" x="5.08" y="2.54" drill="1" diameter="1.6764"/>
<pad name="7" x="7.62" y="0" drill="1"/>
<pad name="8" x="7.62" y="2.54" drill="1"/>
<pad name="9" x="10.16" y="0" drill="1"/>
<pad name="10" x="10.16" y="2.54" drill="1"/>
<pad name="11" x="12.7" y="0" drill="1"/>
<pad name="12" x="12.7" y="2.54" drill="1"/>
<pad name="13" x="15.24" y="0" drill="1"/>
<pad name="14" x="15.24" y="2.54" drill="1"/>
<pad name="15" x="17.78" y="0" drill="1"/>
<pad name="16" x="17.78" y="2.54" drill="1"/>
<pad name="17" x="20.32" y="0" drill="1"/>
<pad name="18" x="20.32" y="2.54" drill="1"/>
<pad name="19" x="22.86" y="0" drill="1"/>
<pad name="20" x="22.86" y="2.54" drill="1"/>
<pad name="21" x="25.4" y="0" drill="1"/>
<pad name="22" x="25.4" y="2.54" drill="1"/>
<pad name="23" x="27.94" y="0" drill="1"/>
<pad name="24" x="27.94" y="2.54" drill="1"/>
<pad name="25" x="30.48" y="0" drill="1"/>
<pad name="26" x="30.48" y="2.54" drill="1"/>
<text x="10" y="-3" size="1.27" layer="25" ratio="10" rot="R180">&gt;NAME</text>
<text x="0.5" y="-2.5" size="1.27" layer="21" ratio="10" rot="R180">1</text>
<text x="34" y="3.5" size="1.27" layer="21" ratio="10" rot="R180">26</text>
<text x="23.5" y="-3" size="1.27" layer="27" ratio="10" rot="R180">&gt;VALUE</text>
<text x="7.7286" y="-24.3961" size="1.27" layer="51" rot="R90">SD Card </text>
<text x="-0.4964" y="-1.6961" size="0.4064" layer="51">3v3</text>
<text x="-0.3714" y="3.9289" size="0.4064" layer="51">5v</text>
<text x="4.2786" y="3.8789" size="0.4064" layer="51">GND</text>
<text x="87.69" y="-22.05" size="1.27" layer="51" rot="R90">USB</text>
<text x="81.24" y="-42.15" size="1.27" layer="51" rot="R90">RJ45</text>
<text x="0.215" y="-46.425" size="1.27" layer="51" rot="R90">usb +5V</text>
<text x="12.5" y="-32.225" size="1.27" layer="51" rot="R90">SD card holder 5mm bottom sick</text>
<text x="34" y="0.5" size="1.27" layer="21" ratio="10" rot="R180">25</text>
<text x="34.4" y="-22.4" size="1.27" layer="51">Board 56x85mm H=16mm</text>
<text x="60.35" y="2.475" size="1.27" layer="51">Audio</text>
<text x="41.2" y="1.15" size="1.27" layer="51">RCA</text>
<text x="39.975" y="-46.925" size="1.27" layer="51">HDMI</text>
</package>
</packages>
<symbols>
<symbol name="RASPBERRY-PI">
<wire x1="-15.24" y1="53.34" x2="22.86" y2="53.34" width="0.254" layer="94"/>
<wire x1="22.86" y1="53.34" x2="22.86" y2="-12.7" width="0.254" layer="94"/>
<wire x1="22.86" y1="-12.7" x2="-15.24" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-12.7" x2="-15.24" y2="53.34" width="0.254" layer="94"/>
<pin name="1-+3V3" x="-20.32" y="50.8" length="middle"/>
<pin name="2-+5V" x="27.94" y="50.8" length="middle" rot="R180"/>
<pin name="3-SDA0" x="-20.32" y="45.72" length="middle"/>
<pin name="4-DNC" x="27.94" y="45.72" length="middle" rot="R180"/>
<pin name="5-SCL0" x="-20.32" y="40.64" length="middle"/>
<pin name="6-GND" x="27.94" y="40.64" length="middle" rot="R180"/>
<pin name="7-GPIO7" x="-20.32" y="35.56" length="middle"/>
<pin name="8-TX" x="27.94" y="35.56" length="middle" rot="R180"/>
<pin name="9-DNC" x="-20.32" y="30.48" length="middle"/>
<pin name="10-RX" x="27.94" y="30.48" length="middle" rot="R180"/>
<pin name="11-GPIO0" x="-20.32" y="25.4" length="middle"/>
<pin name="12-GPIO1" x="27.94" y="25.4" length="middle" rot="R180"/>
<pin name="13-GPIO2" x="-20.32" y="20.32" length="middle"/>
<pin name="14-DNC" x="27.94" y="20.32" length="middle" rot="R180"/>
<pin name="15-GPIO3" x="-20.32" y="15.24" length="middle"/>
<pin name="16-GPIO4" x="27.94" y="15.24" length="middle" rot="R180"/>
<pin name="17-DNC" x="-20.32" y="10.16" length="middle"/>
<pin name="18-GPIO5" x="27.94" y="10.16" length="middle" rot="R180"/>
<pin name="19-SPI-MOSI" x="-20.32" y="5.08" length="middle"/>
<pin name="20-DNC" x="27.94" y="5.08" length="middle" rot="R180"/>
<pin name="21-SPI-MISO" x="-20.32" y="0" length="middle"/>
<pin name="22-GPIO6" x="27.94" y="0" length="middle" rot="R180"/>
<pin name="23-SPI-SCLK" x="-20.32" y="-5.08" length="middle"/>
<pin name="24-SPI-CE0-N" x="27.94" y="-5.08" length="middle" rot="R180"/>
<pin name="25-DNC" x="-20.32" y="-10.16" length="middle"/>
<pin name="26-SPI-CE1-N" x="27.94" y="-10.16" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RASPBERRY-PI">
<description>&lt;b&gt;&lt;a href="http://www.raspberrypi.org/"&gt;Raspberry Pi Board&lt;/a&gt;&lt;b&gt;&lt;br&gt;
&lt;br&gt;Jacques Lagnel V1.0 (beta) 2012&lt;br&gt;&lt;br&gt;

Board dimension:&lt;br&gt;
&lt;a href="http://www.raspberrypi.org/forum/general-discussion/mechanical-profile-3d-models?value=3d%20model&amp;type=1&amp;include=1&amp;search=1&amp;ret=all"&gt;Forum 3D model&lt;/a&gt;&lt;br&gt;
The GPIO Connector (P1):&lt;br&gt;
&lt;a href="http://elinux.org/RPi_Low-level_peripherals"&gt;http://elinux.org/RPi_Low-level_peripherals&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="RASPBERRY-PI" x="-2.54" y="-20.32"/>
</gates>
<devices>
<device name="" package="RASPBERRY-PI">
<connects>
<connect gate="G$1" pin="1-+3V3" pad="1"/>
<connect gate="G$1" pin="10-RX" pad="10"/>
<connect gate="G$1" pin="11-GPIO0" pad="11"/>
<connect gate="G$1" pin="12-GPIO1" pad="12"/>
<connect gate="G$1" pin="13-GPIO2" pad="13"/>
<connect gate="G$1" pin="14-DNC" pad="14"/>
<connect gate="G$1" pin="15-GPIO3" pad="15"/>
<connect gate="G$1" pin="16-GPIO4" pad="16"/>
<connect gate="G$1" pin="17-DNC" pad="17"/>
<connect gate="G$1" pin="18-GPIO5" pad="18"/>
<connect gate="G$1" pin="19-SPI-MOSI" pad="19"/>
<connect gate="G$1" pin="2-+5V" pad="2"/>
<connect gate="G$1" pin="20-DNC" pad="20"/>
<connect gate="G$1" pin="21-SPI-MISO" pad="21"/>
<connect gate="G$1" pin="22-GPIO6" pad="22"/>
<connect gate="G$1" pin="23-SPI-SCLK" pad="23"/>
<connect gate="G$1" pin="24-SPI-CE0-N" pad="24"/>
<connect gate="G$1" pin="25-DNC" pad="25"/>
<connect gate="G$1" pin="26-SPI-CE1-N" pad="26"/>
<connect gate="G$1" pin="3-SDA0" pad="3"/>
<connect gate="G$1" pin="4-DNC" pad="4"/>
<connect gate="G$1" pin="5-SCL0" pad="5"/>
<connect gate="G$1" pin="6-GND" pad="6"/>
<connect gate="G$1" pin="7-GPIO7" pad="7"/>
<connect gate="G$1" pin="8-TX" pad="8"/>
<connect gate="G$1" pin="9-DNC" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="SparkFun" deviceset="AD7302" device="SMD"/>
<part name="U$2" library="SparkFun" deviceset="5V" device=""/>
<part name="GND1" library="SparkFun" deviceset="GND" device=""/>
<part name="P+2" library="SparkFun" deviceset="3.3V" device=""/>
<part name="U$1" library="RaspberryPi" deviceset="RASPBERRY-PI" device=""/>
<part name="GND2" library="SparkFun" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-38.1" y="99.06" size="1.778" layer="91">Raspberry Pi </text>
<text x="-38.1" y="96.52" size="1.778" layer="91">Header P1</text>
<text x="83.82" y="106.68" size="1.778" layer="91">RPi pin 2 </text>
<text x="58.42" y="106.68" size="1.778" layer="91">Laser Power Supply</text>
<text x="78.74" y="96.52" size="1.778" layer="91">RPi pin 6</text>
<text x="20.32" y="58.42" size="1.4224" layer="91">RPi pin 18</text>
<text x="20.32" y="78.74" size="1.4224" layer="91">RPi pin 21</text>
<text x="20.32" y="81.28" size="1.4224" layer="91">RPi pin 22</text>
<text x="20.32" y="83.82" size="1.4224" layer="91">RPi pin 23</text>
<text x="20.32" y="86.36" size="1.4224" layer="91">RPi pin 24</text>
<text x="58.42" y="104.14" size="1.4224" layer="91">Analog output 0 - 5V</text>
<text x="-38.1" y="111.76" size="1.4224" layer="91">Wiring the DAC as a 4 bit parallel DA converter</text>
<text x="96.52" y="106.68" size="1.778" layer="91">RPi pin 1</text>
<text x="40.64" y="33.02" size="1.778" layer="91">RPi pin 25</text>
<text x="73.66" y="78.74" size="1.27" layer="91">NC</text>
</plain>
<instances>
<instance part="U1" gate="G$1" x="58.42" y="73.66"/>
<instance part="U$2" gate="G$1" x="93.98" y="99.06"/>
<instance part="GND1" gate="1" x="38.1" y="25.4"/>
<instance part="P+2" gate="G$1" x="101.6" y="99.06"/>
<instance part="U$1" gate="G$1" x="-17.78" y="40.64"/>
<instance part="GND2" gate="1" x="86.36" y="91.44" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="CS"/>
<wire x1="43.18" y1="63.5" x2="40.64" y2="63.5" width="0.1524" layer="91"/>
<wire x1="40.64" y1="63.5" x2="38.1" y2="60.96" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="38.1" y1="60.96" x2="38.1" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="AB"/>
<wire x1="38.1" y1="50.8" x2="38.1" y2="27.94" width="0.1524" layer="91"/>
<wire x1="73.66" y1="60.96" x2="73.66" y2="55.88" width="0.1524" layer="91"/>
<wire x1="73.66" y1="55.88" x2="71.12" y2="53.34" width="0.1524" layer="91"/>
<wire x1="71.12" y1="53.34" x2="40.64" y2="53.34" width="0.1524" layer="91"/>
<wire x1="40.64" y1="53.34" x2="38.1" y2="50.8" width="0.1524" layer="91"/>
<junction x="38.1" y="50.8"/>
<pinref part="U1" gate="G$1" pin="LDAC"/>
<wire x1="73.66" y1="66.04" x2="76.2" y2="66.04" width="0.1524" layer="91"/>
<wire x1="76.2" y1="66.04" x2="78.74" y2="63.5" width="0.1524" layer="91"/>
<wire x1="78.74" y1="63.5" x2="78.74" y2="55.88" width="0.1524" layer="91"/>
<wire x1="78.74" y1="55.88" x2="76.2" y2="53.34" width="0.1524" layer="91"/>
<wire x1="76.2" y1="53.34" x2="71.12" y2="53.34" width="0.1524" layer="91"/>
<junction x="71.12" y="53.34"/>
<wire x1="81.28" y1="81.28" x2="81.28" y2="55.88" width="0.1524" layer="91"/>
<wire x1="81.28" y1="55.88" x2="78.74" y2="53.34" width="0.1524" layer="91"/>
<wire x1="78.74" y1="53.34" x2="76.2" y2="53.34" width="0.1524" layer="91"/>
<junction x="76.2" y="53.34"/>
<pinref part="U1" gate="G$1" pin="DGND"/>
<wire x1="73.66" y1="83.82" x2="78.74" y2="83.82" width="0.1524" layer="91"/>
<wire x1="78.74" y1="83.82" x2="81.28" y2="81.28" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="AGND"/>
<wire x1="73.66" y1="76.2" x2="83.82" y2="76.2" width="0.1524" layer="91"/>
<wire x1="83.82" y1="76.2" x2="86.36" y2="78.74" width="0.1524" layer="91"/>
<wire x1="86.36" y1="78.74" x2="86.36" y2="88.9" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DB5"/>
<wire x1="43.18" y1="78.74" x2="40.64" y2="78.74" width="0.1524" layer="91"/>
<wire x1="40.64" y1="78.74" x2="38.1" y2="81.28" width="0.1524" layer="91"/>
<wire x1="38.1" y1="81.28" x2="30.48" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DB6"/>
<wire x1="43.18" y1="81.28" x2="40.64" y2="81.28" width="0.1524" layer="91"/>
<wire x1="40.64" y1="81.28" x2="38.1" y2="83.82" width="0.1524" layer="91"/>
<wire x1="38.1" y1="83.82" x2="30.48" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DB7"/>
<wire x1="43.18" y1="83.82" x2="40.64" y2="83.82" width="0.1524" layer="91"/>
<wire x1="40.64" y1="83.82" x2="38.1" y2="86.36" width="0.1524" layer="91"/>
<wire x1="38.1" y1="86.36" x2="30.48" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="WR"/>
<wire x1="43.18" y1="60.96" x2="40.64" y2="58.42" width="0.1524" layer="91"/>
<wire x1="40.64" y1="58.42" x2="30.48" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VOUTA"/>
<wire x1="73.66" y1="81.28" x2="76.2" y2="83.82" width="0.1524" layer="91"/>
<wire x1="76.2" y1="83.82" x2="76.2" y2="101.6" width="0.1524" layer="91"/>
<junction x="76.2" y="101.6"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DB0"/>
<wire x1="43.18" y1="66.04" x2="40.64" y2="66.04" width="0.1524" layer="91"/>
<wire x1="40.64" y1="66.04" x2="38.1" y2="68.58" width="0.1524" layer="91"/>
<wire x1="38.1" y1="68.58" x2="38.1" y2="71.12" width="0.1524" layer="91"/>
<wire x1="38.1" y1="71.12" x2="38.1" y2="73.66" width="0.1524" layer="91"/>
<wire x1="38.1" y1="73.66" x2="38.1" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="DB1"/>
<wire x1="43.18" y1="68.58" x2="40.64" y2="68.58" width="0.1524" layer="91"/>
<wire x1="40.64" y1="68.58" x2="38.1" y2="71.12" width="0.1524" layer="91"/>
<junction x="38.1" y="71.12"/>
<pinref part="U1" gate="G$1" pin="DB2"/>
<wire x1="43.18" y1="71.12" x2="40.64" y2="71.12" width="0.1524" layer="91"/>
<wire x1="40.64" y1="71.12" x2="38.1" y2="73.66" width="0.1524" layer="91"/>
<junction x="38.1" y="73.66"/>
<pinref part="U1" gate="G$1" pin="DB3"/>
<wire x1="43.18" y1="73.66" x2="40.64" y2="73.66" width="0.1524" layer="91"/>
<wire x1="40.64" y1="73.66" x2="38.1" y2="76.2" width="0.1524" layer="91"/>
<junction x="38.1" y="76.2"/>
<wire x1="38.1" y1="78.74" x2="30.48" y2="78.74" width="0.1524" layer="91"/>
<wire x1="38.1" y1="76.2" x2="38.1" y2="78.74" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="DB4"/>
<wire x1="43.18" y1="76.2" x2="40.64" y2="76.2" width="0.1524" layer="91"/>
<wire x1="40.64" y1="76.2" x2="38.1" y2="78.74" width="0.1524" layer="91"/>
<junction x="38.1" y="78.74"/>
</segment>
</net>
<net name="3.3V" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="CLR"/>
<wire x1="73.66" y1="68.58" x2="99.06" y2="68.58" width="0.1524" layer="91"/>
<wire x1="101.6" y1="99.06" x2="101.6" y2="71.12" width="0.1524" layer="91"/>
<wire x1="101.6" y1="71.12" x2="99.06" y2="68.58" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="PD"/>
<wire x1="73.66" y1="63.5" x2="99.06" y2="63.5" width="0.1524" layer="91"/>
<wire x1="99.06" y1="63.5" x2="101.6" y2="66.04" width="0.1524" layer="91"/>
<wire x1="101.6" y1="66.04" x2="101.6" y2="71.12" width="0.1524" layer="91"/>
<junction x="101.6" y="71.12"/>
<pinref part="P+2" gate="G$1" pin="3.3V"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="5V"/>
<wire x1="93.98" y1="99.06" x2="93.98" y2="76.2" width="0.1524" layer="91"/>
<wire x1="93.98" y1="76.2" x2="93.98" y2="73.66" width="0.1524" layer="91"/>
<wire x1="93.98" y1="73.66" x2="91.44" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="VDD"/>
<wire x1="73.66" y1="71.12" x2="91.44" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="REFIN"/>
<wire x1="73.66" y1="73.66" x2="91.44" y2="73.66" width="0.1524" layer="91"/>
<wire x1="91.44" y1="73.66" x2="93.98" y2="76.2" width="0.1524" layer="91"/>
<junction x="93.98" y="76.2"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
