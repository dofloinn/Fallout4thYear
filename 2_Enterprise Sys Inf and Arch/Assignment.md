<h3 style="text-align: center">Information</h3>
<br>
<p style="text-align: center;">
Enterprise Systems Infrastructure and Architecture Assignment
</p>
<p style="text-align: center;">
Dáithí O'Flynn
</p>
<p style="text-align: center;">
C22344363
</p>
<p style="text-align: center;">
03/05/2026
</p>


<br>
<h3 style="text-align: center">Main</h3>

Physical AI refers to intelligent systems that perceive and act within the physical world. This uses sensors, robotic platforms and machine learning to produce systems capable of operating within the real-world environment.

This report examines two enterprise domains that make use of Physical AI: surgical robots in healthcare and autonomous robotics in agriculture. Four peer-reviewed papers published between 2022 and 2025 were researched in preparation for this report. It discusses the current state of each technology, how physical AI is implemented in the respective industries and the potential and challenges that could be faced in the future.

<br>
<h3 style="text-align: center">Physical AI in Healthcare Enterprises</h3>

<h4 style="text-align: center">Application</h4>

Healthcare is a large, complex enterprise. The operational infrastructure of hospitals and healthcare institutions increasingly incorporates physical AI in the form of AI-driven surgical robotic systems. These systems use real-time sensor data, machine learning, and precision mechanical actuation to assist or guide surgeons during medical procedures.

Nigam et al. [1] provide a comprehensive overview of the evolution of surgical robotics, tracing the field from early, manually controlled systems, such as the PUMA 560 in 1985, used for basic position control, to modern systems. Prominent among these modern systems are the Da Vinci Surgical System, which delivers high-definition 3D visualisation and motion scaling, as well as the Smart Tissue Autonomous Robot (STAR), which has demonstrated near-autonomous soft-tissue suturing with high accuracy. These systems intake visual and sensor inputs in real time, use AI to interpret them and make decisions. They adapt robotic arm movements to the surgical field, and in advanced cases, execute tasks with minimal human intervention.

The systematic review conducted by Ng [2] compiles findings from twelve studies published in 2024, covering AI surgical applications across urology, plastic surgery, spine surgery, ophthalmology, gastroenterology, and paediatric surgery. The wide coverage of surgical disciplines underlines that AI-driven surgical robotics is not a niche technology but a broad infrastructural shift across healthcare enterprise settings. Key capabilities identified include AI-enhanced preoperative imaging, real-time intraoperative data analysis, and automated instrument control. 

For example, in urology AI-guided robotic systems assist surgeons in navigating the anatomy of the prostate by analysing preoperative imaging and providing real-time feedback [2]. In spinal surgery, AI has improved the accuracy of vertebral screw placements, reducing complications and shortening patient recovery times [2].

From an enterprise infrastructure perspective, the integration of these systems is more involved than just purchasing a robot. Healthcare organisations must invest in data management pipelines capable of handling large volumes of patient imaging data, secure networked environments that protect sensitive health information. This would also have to comply with medical privacy laws like HIPPA in the USA and GDPR within the EU. The AI-integrated workflow described by Nigam et al. spans initial consultation, AI-driven image simulation, diagnostic support, surgical planning, robotic-assisted decision-making, and post-procedure follow-up. 
<br>
<h4 style="text-align: center">Potential/Future Challenges</h4>

The trajectory of AI-driven surgical robotics points toward increasingly autonomous systems. Nigam et al. [1] envision a future in which fully autonomous surgical robots, guided by machine learning, robotics, and AR (augmented reality), perform intricate procedures with minimal human involvement. Such systems would free surgeons to focus on higher-level clinical judgement while automated components manage routine or repetitive intraoperative tasks. Ng [2] agrees with this outlook. It noted that AI systems equipped with machine learning continuously improve their precision and decision-making capabilities over time. This results in them becoming progressively more adept at handling dynamic surgical environments. The potential incorporation of 5G-enabled telesurgery, where expert surgeons operate robotic systems remotely in underserved or rural settings, represents another significant enterprise opportunity [1], extending the reach of high-quality surgical care without requiring physical co-location.

Despite its promise, the deployment of Physical AI in surgical settings faces substantial challenges that enterprise decision-makers must address. Cost is a primary barrier; Ng [2] notes that acquiring and maintaining AI-driven robotic systems imposes significant financial burdens, particularly for hospitals in low- and middle-income regions. This creates a pronounced disparity in access, with advanced systems concentrated in well-resourced institutions. Nigam et al. [1] report acquisition costs exceeding $1.5 million for leading platforms, placing them beyond reach for many healthcare enterprises.

Ethical and legal complexity is common in discussions are use of AI, especially in healthcare. Unlike conventional surgical procedures where human surgeons bear direct responsibility for outcomes, AI-assisted systems complicate the attribution of liability when adverse events occur [2]. There is currently no universally accepted accountability framework to determine whether developers, healthcare providers, or manufacturers should bear responsibility for AI-induced errors. 

Data privacy represents a further concern, as mentioned when discussing HIPPA and GDPR previously. AI surgical systems are trained on vast patient datasets, and as these systems become more interconnected, the risk of data breaches increases substantially [2]. Historically, Regulatory bodies have also struggled to keep pace with the speed of technological development and AI is not exempt from this problem. This has lead to delays in approval processes and inconsistent standards across jurisdictions [2]. 

Finally, the integration of AI into existing clinical workflows requires extensive staff training and organisational change management, which is fairly resource-intensive [1].

<br>
<h3 style="text-align: center">Area 2: Autonomous Robotics in Agricultural Enterprise</h3>

<h4 style="text-align: center">Application</h4>

Agriculture is another enterprise domain undergoing transformation through use of Physical AI. Farming operations - both large commercial enterprises or smaller, more localised operations - face persistent challenges including labour shortages, rising costs, environmental pressures, and the need to produce more food with fewer resources. Autonomous agricultural robots equipped with computer vision, deep learning, and sensor arrays, are being developed and tested to address these challenges directly.

Zhang and Qiao [3] provided an editorial overview of the role of AI, sensors, and robotics in smart agriculture. They articulated how the combination of these technologies enables data-driven, precision-managed farming. 

Agricultural sensors that can monitor variables such as soil moisture, temperature, humidity, light, nutrients, and crop health, are integrated with AI systems. These system can provide farmers with real-time situational awareness across fields, greenhouses, and livestock facilities [3]. These sensors can passively collect data and are then when coupled with AI analytics and robotic actuators, to form Physical AI systems. The systems are capable of autonomous intervention, whether that is targeted pesticide application, automated irrigation, or selective harvesting.

Miao et al. [4] developed an autonomous truss tomato harvesting robot tested in both laboratory and real greenhouse environments. Tomato harvesting represents a labour-intensive bottleneck in production of tomato-based products. The paper notes that harvesting accounts for over 40% of the total workforce in tomato production [4], making it a prime target for robotic automation. 

The system developed by that team integrated a robot arm with 6 degrees of freedom, a depth (RGBD) camera, LiDAR-based autonomous navigation, and a suite of perception algorithms. These algorithms were built on the YOLOv5 deep learning network. 

The robot can autonomously detect tomato clusters, estimate their ripeness using a colour-based maturity algorithm, navigate towards ripe fruit, localise the stem cutting point with millimetre precision, and execute the picking operation - all without human intervention during the harvesting sequence. In field tests, the system achieved a 90% success rate in reaching and clamping stems, with an average harvesting time of 9 seconds per cluster [4].
The robot operated within a ROS (Robot Operating System) software architecture, which integrated multiple sensor modalities, performed real-time data fusion, and executed motion planning through inverse kinematics. 

For an agricultural enterprise deploying systems at scale, this would require investment in edge computing hardware (hardware that exists at the "edge"/remote end of a computer network). This is because it requires robust wireless connectivity across field environments, maintenance capabilities for complex electromechanical systems, and data pipelines for continuous model retraining as seasonal and environmental conditions change.

Zhang and Qiao [3] emphasised that the value of sensor-based agricultural AI extends beyond individual tasks like harvesting. Providing real-time monitoring of crop status and environmental conditions allowed these systems to support decision-making across the entire production cycle. This ranged from pre-planting soil analysis to post-harvest quality assessment. 

For enterprise-scale farming operations, this represents a shift in how production is planned and managed, moving from periodic human inspection toward continuous autonomous oversight.

<br>
<h4 style="text-align: center">Potential/Future Challenges</h4>

The potential for Physical AI to reshape agricultural enterprises is substantial. Zhang and Qiao [3] argue that sensor and robotics technologies are moving traditional agricultural production toward intelligent, automated, and remotely managed operations. This would allow agricultural enterprises to attain higher levels of productivity and sustainability. As AI systems improve, robots will become better able to navigate unstructured outdoor environments, handle diverse crop types, and adapt to variable weather and lighting conditions.

Miao et al. [4] identified several important directions for future development of their tomato harvesting system. Adaptive colour calibration (adjusting perception thresholds dynamically in response to changing light conditions) would significantly improve robustness in real-world deployment. The development of softer, reconfigurable grippers capable of handling stems with varied orientations and lengths would increase the harvest success rate. Integration of a conveyor or automated transfer mechanism would allow the robot to harvest multiple clusters in succession without the delays currently imposed by repositioning between picks, substantially improving operational throughput. 

Looking further ahead, the integration of agricultural AI with 5G networks and cloud platforms could enable fleets of coordinated autonomous robots managed from centralised enterprise systems, supporting large-scale precision agriculture at a level currently impossible with human labour alone [1].

Miao et al. [4] encountered a number of challenges in real greenhouse trials that highlight the gap between laboratory performance and field-ready systems. Mapping and navigation in greenhouse environments proved difficult due to the monotonous visual features of plant rows, causing localisation inaccuracies. The compressed soil surfaces also caused wheel slip on the robot's mobile platform. Most significantly, the complexity of real crop environments - random stem orientations, partial occlusion by foliage, varied lighting, and diverse fruit sizes - degraded object detection accuracy compared to controlled conditions [4].

Zhang and Qiao [3] identified broader challenges at the enterprise and systems level. Agricultural environments pose unique difficulties for sensor systems: rapidly varying light conditions, wind, temperature fluctuations, and combinations of multiple environmental stresses simultaneously challenge the robustness of both hardware and AI models. Selecting appropriate sensors for specific environments and designing AI systems that remain reliable under such variability are active research problems. 

From an enterprise adoption perspective, the high upfront cost of robotic systems, the need for specialist technical skills to maintain them, and the requirement for reliable connectivity in rural or remote locations all represent friction points that need to be addressed before wide commercial deployment would be considered viable [3].

<br>
<h3 style="text-align: center;">Conclusion</h3>

Physical AI is transitioning from research curiosity to enterprise infrastructure reality across multiple sectors. In healthcare, AI-driven surgical robotics is improving precision, reducing complications, and expanding the scope of minimally invasive surgery, while demanding new approaches to ethics, liability, data governance, and staff training from enterprise technology leaders. In agriculture, autonomous robots equipped with deep learning and multi-modal sensing are beginning to address the labour and efficiency pressures that threaten food production systems, though significant technical and logistical challenges remain before large-scale commercial deployment is achieved.

Both domains share a common pattern: Physical AI delivers clear operational value but requires substantial enterprise investment in infrastructure, data management, cybersecurity, regulatory compliance, and human capability development. Organisations that proactively address these requirements will be best positioned to capture the transformative potential of Physical AI in the years ahead.

<br>
<br>


<h3 style="text-align: center">References</h3>

[1] S. Nigam, M. Gupta, S. Srivastava, M. A. Khan, S. Malik, and R. Chaturvedi, “Future of AI-Driven Surgical Robotics,” _2025 3rd International Conference on Disruptive Technologies (ICDT)_, pp. 413–418, Mar. 2025, doi: https://doi.org/10.1109/icdt63985.2025.10986377.


[2] J. Ng, “Revolutionizing surgery: AI and robotics for precision, risk reduction, and innovation,” _Journal of Robotic Surgery_, vol. 19, no. 1, Jan. 2025, doi: https://doi.org/10.1007/s11701-024-02205-0.

‌
[3] B. Zhang and Y. Qiao, “AI, Sensors, and Robotics for Smart Agriculture,” _Agronomy_, vol. 14, no. 6, pp. 1180–1180, May 2024, doi: https://doi.org/10.3390/agronomy14061180.


[4] Z. Miao _et al._, “Efficient tomato harvesting robot based on image processing and deep learning,” _Precision Agriculture_, Aug. 2022, doi: https://doi.org/10.1007/s11119-022-09944-w.