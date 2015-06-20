/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/10349*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//variable to hold one object
ParticleEngine engine;
Particle lastParticle;
Particle dragging;

PFont font;

void setup() {
  size(1024, 768);
  //create a particle engine
  engine = new ParticleEngine();
  smooth();
  font = createFont("SansSerif", 11);
  textFont(font);
  
  // aggiungi studente
  
  engine.addParticle(new Particle("am.el", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("am.al", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("au.ni", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ba.al", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ba.lu", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ba.va", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ba.ma", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("be.ag", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("be.mi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("be.jo", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("be.si", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("bi.ni", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("bl.ce", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("bo.fi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("br.si", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ca.iv", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ca.fr", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ca.lu", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ca.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ci.ma", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("cl.ra", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("co.cl", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("de.fe", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("di.cl", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("do.ag", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("dr.el", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("er.ba", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("fa.ce", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("fa.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("fa.pi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("fe.mi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("fe.lu", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("fe.vi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("fu.va", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gi.al", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gi.an", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gi.em", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gi.ce", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gi.mi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gi.au", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gi.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("go.fi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gr.fr", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("gu.sa", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("la.lu", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lo.vi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lu.fr", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lu.ga", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lu.ma", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ma.lu", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ma.cr", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ma.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("me.ma", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("mo.se", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("mo.an", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("mo.and", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("mo.da", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("mo.ra", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("na.el", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("no.el", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("or.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("pa.lo", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("pa.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("pa.ri", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("pe.an", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("pi.se", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("pi.lo", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("po.be", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("pr.an", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ra.lu", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ra.li", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ri.al", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ri.ca", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("sa.gl", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("sa.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("sa.fr", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("sa.ma", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("se.gi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("se.ma", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("si.be", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("sp.fr", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ta.re", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("tu.da", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("va.gr", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("va.mi", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("ve.ma", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("vi.gl", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("za.sa", random(0, 0), random(0, 0), 0, 0));
  
  
  // aggiungi corso
  
  engine.addParticle(new Particle("design management", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("critica del design", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lab. comunicazione 3", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lab. comunicazione 2", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lab. prodotto 2", random(0, 0), random(0, 0), 0, 0));
  engine.addParticle(new Particle("lab. prodotto 3", random(0, 0), random(0, 0), 0, 0));
  
  // nome studente, posionamento, colore e dimensione 
  
  engine.findParticle("am.el").pin(512, 59);
  engine.findParticle("am.el").setColor(230, 0, 126);
  engine.findParticle("am.el").setSize(20);
  
  engine.findParticle("am.al").pin(552, 62);
  engine.findParticle("am.al").setColor(230, 0, 126);
  engine.findParticle("am.al").setSize(20);
  
  engine.findParticle("au.ni").pin(592, 70);
  engine.findParticle("au.ni").setColor(0, 159, 227);
  engine.findParticle("au.ni").setSize(20);
 
  engine.findParticle("ba.al").pin(630, 83);
  engine.findParticle("ba.al").setColor(230, 0, 126);
  engine.findParticle("ba.al").setSize(20);
  
  engine.findParticle("ba.lu").pin(666, 100);
  engine.findParticle("ba.lu").setColor(0, 159, 227);
  engine.findParticle("ba.lu").setSize(20);
  
  engine.findParticle("ba.va").pin(700, 121);
  engine.findParticle("ba.va").setColor(230, 0, 126);
  engine.findParticle("ba.va").setSize(20);
  
  engine.findParticle("ba.ma").pin(730, 148);
  engine.findParticle("ba.ma").setColor(230, 0, 126);
  engine.findParticle("ba.ma").setSize(20);
  
  engine.findParticle("be.ag").pin(757, 177);
  engine.findParticle("be.ag").setColor(0, 159, 227);
  engine.findParticle("be.ag").setSize(20);
 
  engine.findParticle("be.mi").pin(780, 210);
  engine.findParticle("be.mi").setColor(0, 159, 227);
  engine.findParticle("be.mi").setSize(20);
  
  engine.findParticle("be.jo").pin(799, 246);
  engine.findParticle("be.jo").setColor(0, 159, 227);
  engine.findParticle("be.jo").setSize(20);
  
  engine.findParticle("be.si").pin(812, 284);
  engine.findParticle("be.si").setColor(230, 0, 126);
  engine.findParticle("be.si").setSize(20);
  
  engine.findParticle("bi.ni").pin(819, 323);
  engine.findParticle("bi.ni").setColor(230, 0, 126);
  engine.findParticle("bi.ni").setSize(20);
  
  engine.findParticle("bl.ce").pin(824, 362);
  engine.findParticle("bl.ce").setColor(230, 0, 126);
  engine.findParticle("bl.ce").setSize(20);
  
  engine.findParticle("bo.fi").pin(824, 400);
  engine.findParticle("bo.fi").setColor(0, 159, 227);
  engine.findParticle("bo.fi").setSize(20);
  
  engine.findParticle("br.si").pin(820, 439);
  engine.findParticle("br.si").setColor(230, 0, 126);
  engine.findParticle("br.si").setSize(20);
  
  engine.findParticle("ca.iv").pin(812, 478);
  engine.findParticle("ca.iv").setColor(0, 159, 227);
  engine.findParticle("ca.iv").setSize(20);
  
  engine.findParticle("ca.fr").pin(798, 516);
  engine.findParticle("ca.fr").setColor(0, 159, 227);
  engine.findParticle("ca.fr").setSize(20);
  
  engine.findParticle("ca.lu").pin(780, 552);
  engine.findParticle("ca.lu").setColor(0, 159, 227);
  engine.findParticle("ca.lu").setSize(20);
  
  engine.findParticle("ca.gi").pin(757, 585);
  engine.findParticle("ca.gi").setColor(230, 0, 126);
  engine.findParticle("ca.gi").setSize(20);
  
  engine.findParticle("ci.ma").pin(730, 614);
  engine.findParticle("ci.ma").setColor(0, 159, 227);
  engine.findParticle("ci.ma").setSize(20);
  
  engine.findParticle("cl.ra").pin(700, 640);
  engine.findParticle("cl.ra").setColor(230, 0, 126);
  engine.findParticle("cl.ra").setSize(20);
  
  engine.findParticle("co.cl").pin(666, 662);
  engine.findParticle("co.cl").setColor(230, 0, 126);
  engine.findParticle("co.cl").setSize(20);
  
  engine.findParticle("de.fe").pin(630, 680);
  engine.findParticle("de.fe").setColor(230, 0, 126);
  engine.findParticle("de.fe").setSize(20);
  
  engine.findParticle("di.cl").pin(592, 692);
  engine.findParticle("di.cl").setColor(0, 159, 227);
  engine.findParticle("di.cl").setSize(20);
  
  engine.findParticle("do.ag").pin(552, 700);
  engine.findParticle("do.ag").setColor(230, 0, 126);
  engine.findParticle("do.ag").setSize(20);
 
  engine.findParticle("dr.el").pin(512, 704);
  engine.findParticle("dr.el").setColor(230, 0, 126);
  engine.findParticle("dr.el").setSize(20);
 
  engine.findParticle("er.ba").pin(472, 700);
  engine.findParticle("er.ba").setColor(230, 0, 126);
  engine.findParticle("er.ba").setSize(20);
  
  engine.findParticle("fa.ce").pin(432, 692);
  engine.findParticle("fa.ce").setColor(230, 0, 126);
  engine.findParticle("fa.ce").setSize(20);
  
  engine.findParticle("fa.gi").pin(393, 680);
  engine.findParticle("fa.gi").setColor(230, 0, 126);
  engine.findParticle("fa.gi").setSize(20);
  
  engine.findParticle("fa.pi").pin(357, 662);
  engine.findParticle("fa.pi").setColor(0, 159, 227);
  engine.findParticle("fa.pi").setSize(20);
  
  engine.findParticle("fe.mi").pin(324, 641);
  engine.findParticle("fe.mi").setColor(0, 159, 227);
  engine.findParticle("fe.mi").setSize(20);
  
  engine.findParticle("fe.lu").pin(294, 614);
  engine.findParticle("fe.lu").setColor(0, 159, 227);
  engine.findParticle("fe.lu").setSize(20);
  
  engine.findParticle("fe.vi").pin(266, 585);
  engine.findParticle("fe.vi").setColor(230, 0, 126);
  engine.findParticle("fe.vi").setSize(20);
  
  engine.findParticle("fu.va").pin(244, 552);
  engine.findParticle("fu.va").setColor(230, 0, 126);
  engine.findParticle("fu.va").setSize(20);
  
  engine.findParticle("gi.al").pin(226, 516);
  engine.findParticle("gi.al").setColor(0, 159, 227);
  engine.findParticle("gi.al").setSize(20);
 
  engine.findParticle("gi.an").pin(212, 478);
  engine.findParticle("gi.an").setColor(0, 159, 227);
  engine.findParticle("gi.an").setSize(20);
  
  engine.findParticle("gi.em").pin(204, 439);
  engine.findParticle("gi.em").setColor(0, 159, 227);
  engine.findParticle("gi.em").setSize(20);
  
  engine.findParticle("gi.ce").pin(200, 400);
  engine.findParticle("gi.ce").setColor(230, 0, 126);
  engine.findParticle("gi.ce").setSize(20);
  
  engine.findParticle("gi.mi").pin(199, 362);
  engine.findParticle("gi.mi").setColor(0, 159, 227);
  engine.findParticle("gi.mi").setSize(20);
  
  engine.findParticle("gi.au").pin(204, 323);
  engine.findParticle("gi.au").setColor(0, 159, 227);
  engine.findParticle("gi.au").setSize(20);
  
  engine.findParticle("gi.gi").pin(211, 284);
  engine.findParticle("gi.gi").setColor(230, 0, 126);
  engine.findParticle("gi.gi").setSize(20);
  
  engine.findParticle("go.fi").pin(225, 246);
  engine.findParticle("go.fi").setColor(0, 159, 227);
  engine.findParticle("go.fi").setSize(20);
  
  engine.findParticle("gr.fr").pin(243, 210);
  engine.findParticle("gr.fr").setColor(230, 0, 126);
  engine.findParticle("gr.fr").setSize(20);
  
  engine.findParticle("gu.sa").pin(266, 177);
  engine.findParticle("gu.sa").setColor(230, 0, 126);
  engine.findParticle("gu.sa").setSize(20);
  
  engine.findParticle("la.lu").pin(293, 148);
  engine.findParticle("la.lu").setColor(0, 159, 227);
  engine.findParticle("la.lu").setSize(20);
  
  engine.findParticle("lo.vi").pin(324, 121);
  engine.findParticle("lo.vi").setColor(0, 159, 227);
  engine.findParticle("lo.vi").setSize(20);
  
  engine.findParticle("lu.fr").pin(357, 100);
  engine.findParticle("lu.fr").setColor(230, 0, 126);
  engine.findParticle("lu.fr").setSize(20);
  
  engine.findParticle("lu.ga").pin(393, 83);
  engine.findParticle("lu.ga").setColor(0, 159, 227);
  engine.findParticle("lu.ga").setSize(20);
  
  engine.findParticle("lu.ma").pin(431, 70);
  engine.findParticle("lu.ma").setColor(0, 159, 227);
  engine.findParticle("lu.ma").setSize(20);
  
  engine.findParticle("ma.lu").pin(471, 62);
  engine.findParticle("ma.lu").setColor(0, 159, 227);
  engine.findParticle("ma.lu").setSize(20);
  
  engine.findParticle("ma.cr").pin(492, 39);
  engine.findParticle("ma.cr").setColor(230, 0, 126);
  engine.findParticle("ma.cr").setSize(20);
  
  engine.findParticle("ma.gi").pin(535, 40);
  engine.findParticle("ma.gi").setColor(230, 0, 126);
  engine.findParticle("ma.gi").setSize(20);
  
  engine.findParticle("me.ma").pin(578, 46);
  engine.findParticle("me.ma").setColor(0, 159, 227);
  engine.findParticle("me.ma").setSize(20);
  
  engine.findParticle("mo.se").pin(619, 57);
  engine.findParticle("mo.se").setColor(230, 0, 126);
  engine.findParticle("mo.se").setSize(20);
  
  engine.findParticle("mo.an").pin(659, 74);
  engine.findParticle("mo.an").setColor(230, 0, 126);
  engine.findParticle("mo.an").setSize(20);
  
  engine.findParticle("mo.and").pin(696, 95);
  engine.findParticle("mo.and").setColor(0, 159, 227);
  engine.findParticle("mo.and").setSize(20);
  
  engine.findParticle("mo.da").pin(729, 121);
  engine.findParticle("mo.da").setColor(0, 159, 227);
  engine.findParticle("mo.da").setSize(20);
  
  engine.findParticle("mo.ra").pin(760, 150);
  engine.findParticle("mo.ra").setColor(0, 159, 227);
  engine.findParticle("mo.ra").setSize(20);
  
  engine.findParticle("na.el").pin(786, 184);
  engine.findParticle("na.el").setColor(230, 0, 126);
  engine.findParticle("na.el").setSize(20);
  
  engine.findParticle("no.el").pin(808, 221);
  engine.findParticle("no.el").setColor(230, 0, 126);
  engine.findParticle("no.el").setSize(20);
  
  engine.findParticle("or.gi").pin(825, 261);
  engine.findParticle("or.gi").setColor(0, 159, 227);
  engine.findParticle("or.gi").setSize(20);
  
  engine.findParticle("pa.lo").pin(835, 302);
  engine.findParticle("pa.lo").setColor(0, 159, 227);
  engine.findParticle("pa.lo").setSize(20);
  
  engine.findParticle("pa.gi").pin(843, 344);
  engine.findParticle("pa.gi").setColor(230, 0, 126);
  engine.findParticle("pa.gi").setSize(20);
  
  engine.findParticle("pa.ri").pin(845, 384);
  engine.findParticle("pa.ri").setColor(0, 159, 227);
  engine.findParticle("pa.ri").setSize(20);
  
  engine.findParticle("pe.an").pin(843, 426);
  engine.findParticle("pe.an").setColor(0, 159, 227);
  engine.findParticle("pe.an").setSize(20);
  
  engine.findParticle("pi.se").pin(837, 468);
  engine.findParticle("pi.se").setColor(230, 0, 126);
  engine.findParticle("pi.se").setSize(20);
  
  engine.findParticle("pi.lo").pin(824, 509);
  engine.findParticle("pi.lo").setColor(0, 159, 227);
  engine.findParticle("pi.lo").setSize(20);
  
  engine.findParticle("po.be").pin(807, 548);
  engine.findParticle("po.be").setColor(230, 0, 126);
  engine.findParticle("po.be").setSize(20);
  
  engine.findParticle("pr.an").pin(785, 585);
  engine.findParticle("pr.an").setColor(0, 159, 227);
  engine.findParticle("pr.an").setSize(20);
  
  engine.findParticle("ra.lu").pin(757, 617);
  engine.findParticle("ra.lu").setColor(0, 159, 227);
  engine.findParticle("ra.lu").setSize(20);
  
  engine.findParticle("ra.li").pin(727, 647);
  engine.findParticle("ra.li").setColor(230, 0, 126);
  engine.findParticle("ra.li").setSize(20);                      //**
  
  engine.findParticle("ri.al").pin(20, 180);
  engine.findParticle("ri.al").setColor(0, 159, 227);
  engine.findParticle("ri.al").setSize(25);
  
  engine.findParticle("ri.ca").pin(20, 180);
  engine.findParticle("ri.ca").setColor(230, 0, 126);
  engine.findParticle("ri.ca").setSize(25);
  
  engine.findParticle("sa.gl").pin(20, 180);
  engine.findParticle("sa.gl").setColor(230, 0, 126);
  engine.findParticle("sa.gl").setSize(25);
  
  engine.findParticle("sa.gi").pin(20, 180);
  engine.findParticle("sa.gi").setColor(230, 0, 126);
  engine.findParticle("sa.gi").setSize(25);
  
  engine.findParticle("sa.fr").pin(20, 180);
  engine.findParticle("sa.fr").setColor(230, 0, 126);
  engine.findParticle("sa.fr").setSize(25);
  
  engine.findParticle("sa.ma").pin(20, 180);
  engine.findParticle("sa.ma").setColor(0, 159, 227);
  engine.findParticle("sa.ma").setSize(25);
  
  engine.findParticle("se.gi").pin(20, 180);
  engine.findParticle("se.gi").setColor(230, 0, 126);
  engine.findParticle("se.gi").setSize(25);
  
  engine.findParticle("se.ma").pin(20, 180);
  engine.findParticle("se.ma").setColor(0, 159, 227);
  engine.findParticle("se.ma").setSize(25);
  
  engine.findParticle("si.be").pin(20, 180);
  engine.findParticle("si.be").setColor(230, 0, 126);
  engine.findParticle("si.be").setSize(25);
  
  engine.findParticle("sp.fr").pin(20, 180);
  engine.findParticle("sp.fr").setColor(230, 0, 126);
  engine.findParticle("sp.fr").setSize(25);
  
  engine.findParticle("ta.re").pin(20, 180);
  engine.findParticle("ta.re").setColor(230, 0, 126);
  engine.findParticle("ta.re").setSize(25);
  
  engine.findParticle("tu.da").pin(20, 180);
  engine.findParticle("tu.da").setColor(0, 159, 227);
  engine.findParticle("tu.da").setSize(25);
  
  engine.findParticle("va.gr").pin(20, 180);
  engine.findParticle("va.gr").setColor(230, 0, 126);
  engine.findParticle("va.gr").setSize(25);
  
  engine.findParticle("va.mi").pin(20, 180);
  engine.findParticle("va.mi").setColor(0, 159, 227);
  engine.findParticle("va.mi").setSize(25);
  
  engine.findParticle("ve.ma").pin(20, 180);
  engine.findParticle("ve.ma").setColor(0, 159, 227);
  engine.findParticle("ve.ma").setSize(25);
  
  engine.findParticle("vi.gl").pin(20, 180);
  engine.findParticle("vi.gl").setColor(230, 0, 126);
  engine.findParticle("vi.gl").setSize(25);
  
  engine.findParticle("za.sa").pin(20, 180);
  engine.findParticle("za.sa").setColor(230, 0, 126);
  engine.findParticle("za.sa").setSize(25);
  
  
 // nome corso, posizionamento, colore e dimensione 
 
  engine.findParticle("design management").pin(511, 195);
  engine.findParticle("design management").setColor(243,153,122);
  engine.findParticle("design management").setSize(50);
  
  engine.findParticle("critica del design").pin(511, 570);
  engine.findParticle("critica del design").setColor(199,196,214);
  engine.findParticle("critica del design").setSize(50);
  
  engine.findParticle("lab. comunicazione 3").pin(678, 469);
  engine.findParticle("lab. comunicazione 3").setColor(127,91,142);
  engine.findParticle("lab. comunicazione 3").setSize(50);
  
  engine.findParticle("lab. comunicazione 2").pin(678, 295);
  engine.findParticle("lab. comunicazione 2").setColor(155,213,225);
  engine.findParticle("lab. comunicazione 2").setSize(50);
  
  engine.findParticle("lab. prodotto 2").pin(344, 295);
  engine.findParticle("lab. prodotto 2").setColor(128,136,79);
  engine.findParticle("lab. prodotto 2").setSize(50);
  
  engine.findParticle("lab. prodotto 3").pin(344, 469);
  engine.findParticle("lab. prodotto 3").setColor(208,222,127);
  engine.findParticle("lab. prodotto 3").setSize(50);
  
  // studenti corso "design management"
  
  engine.connectParticles("am.el", "design management");
  engine.connectParticles("am.al", "design management");
  engine.connectParticles("au.ni", "design management");
  engine.connectParticles("ba.al", "design management");
  engine.connectParticles("ba.va", "design management");
  engine.connectParticles("ba.ma", "design management");
  engine.connectParticles("be.ag", "design management");
  engine.connectParticles("be.mi", "design management");
  engine.connectParticles("be.jo", "design management");
  engine.connectParticles("be.si", "design management");
  engine.connectParticles("bi.ni", "design management");
  engine.connectParticles("bl.ce", "design management");
  engine.connectParticles("bo.fi", "design management");
  engine.connectParticles("br.si", "design management");
  engine.connectParticles("ca.iv", "design management");
  engine.connectParticles("ca.fr", "design management");
  engine.connectParticles("ca.lu", "design management");
  engine.connectParticles("ca.gi", "design management");
  engine.connectParticles("ci.ma", "design management");
  engine.connectParticles("cl.ra", "design management");
  engine.connectParticles("co.cl", "design management");
  engine.connectParticles("de.fe", "design management");
  engine.connectParticles("di.cl", "design management");
  engine.connectParticles("do.ag", "design management");
  engine.connectParticles("dr.el", "design management");
  engine.connectParticles("er.ba", "design management");
  engine.connectParticles("fa.ce", "design management");
  engine.connectParticles("fa.gi", "design management");
  engine.connectParticles("fa.pi", "design management");
  engine.connectParticles("fe.mi", "design management");
  engine.connectParticles("fe.lu", "design management");
  engine.connectParticles("fe.vi", "design management");
  engine.connectParticles("fu.va", "design management");
  engine.connectParticles("gi.al", "design management");
  engine.connectParticles("gi.an", "design management");
  engine.connectParticles("gi.em", "design management");
  engine.connectParticles("gi.ce", "design management");
  engine.connectParticles("gi.mi", "design management");
  engine.connectParticles("gi.au", "design management");
  engine.connectParticles("gi.gi", "design management");
  engine.connectParticles("go.fi", "design management");
  engine.connectParticles("gr.fr", "design management");
  engine.connectParticles("gu.sa", "design management");
  engine.connectParticles("la.lu", "design management");
  engine.connectParticles("lo.vi", "design management");
  engine.connectParticles("lu.fr", "design management");
  engine.connectParticles("lu.ga", "design management");
  engine.connectParticles("lu.ma", "design management");
  engine.connectParticles("ma.lu", "design management");
  engine.connectParticles("ma.cr", "design management");
  engine.connectParticles("ma.gi", "design management");
  engine.connectParticles("me.ma", "design management");
  engine.connectParticles("mo.se", "design management");
  engine.connectParticles("mo.an", "design management");
  engine.connectParticles("mo.and", "design management");
  engine.connectParticles("mo.da", "design management");
  engine.connectParticles("mo.ra", "design management");
  engine.connectParticles("na.el", "design management");
  engine.connectParticles("no.el", "design management");
  engine.connectParticles("or.gi", "design management");
  engine.connectParticles("pa.lo", "design management");
  engine.connectParticles("pa.gi", "design management");
  engine.connectParticles("pa.ri", "design management");
  engine.connectParticles("pe.an", "design management");
  engine.connectParticles("pi.se", "design management");
  engine.connectParticles("pi.lo", "design management");
  engine.connectParticles("po.be", "design management");
  engine.connectParticles("pr.an", "design management");
  engine.connectParticles("ra.lu", "design management");
  engine.connectParticles("ra.li", "design management");
  engine.connectParticles("ri.al", "design management");
  engine.connectParticles("ri.ca", "design management");
  engine.connectParticles("sa.gl", "design management");
  engine.connectParticles("sa.gi", "design management");
  engine.connectParticles("sa.fr", "design management");
  engine.connectParticles("sa.ma", "design management");
  engine.connectParticles("se.gi", "design management");
  engine.connectParticles("se.ma", "design management");
  engine.connectParticles("si.be", "design management");
  engine.connectParticles("sp.fr", "design management");
  engine.connectParticles("ta.re", "design management");
  engine.connectParticles("tu.da", "design management");
  engine.connectParticles("va.gr", "design management");
  engine.connectParticles("va.mi", "design management");
  engine.connectParticles("ve.ma", "design management");
  engine.connectParticles("vi.gl", "design management");
  engine.connectParticles("za.sa", "design management");
  
  // studenti corso "critica del design"
  
  engine.connectParticles("am.el", "critica del design");
  engine.connectParticles("am.al", "critica del design");
  engine.connectParticles("au.ni", "critica del design");
  engine.connectParticles("ba.al", "critica del design");
  engine.connectParticles("ba.va", "critica del design");
  engine.connectParticles("ba.ma", "critica del design");
  engine.connectParticles("be.ag", "critica del design");
  engine.connectParticles("be.mi", "critica del design");
  engine.connectParticles("be.jo", "critica del design");
  engine.connectParticles("be.si", "critica del design");
  engine.connectParticles("bi.ni", "critica del design");
  engine.connectParticles("bl.ce", "critica del design");
  engine.connectParticles("bo.fi", "critica del design");
  engine.connectParticles("br.si", "critica del design");
  engine.connectParticles("ca.iv", "critica del design");
  engine.connectParticles("ca.fr", "critica del design");
  engine.connectParticles("ca.lu", "critica del design");
  engine.connectParticles("ca.gi", "critica del design");
  engine.connectParticles("ci.ma", "critica del design");
  engine.connectParticles("cl.ra", "critica del design");
  engine.connectParticles("co.cl", "critica del design");
  engine.connectParticles("de.fe", "critica del design");
  engine.connectParticles("di.cl", "critica del design");
  engine.connectParticles("do.ag", "critica del design");
  engine.connectParticles("dr.el", "critica del design");
  engine.connectParticles("er.ba", "critica del design");
  engine.connectParticles("fa.ce", "critica del design");
  engine.connectParticles("fa.gi", "critica del design");
  engine.connectParticles("fa.pi", "critica del design");
  engine.connectParticles("fe.mi", "critica del design");
  engine.connectParticles("fe.lu", "critica del design");
  engine.connectParticles("fe.vi", "critica del design");
  engine.connectParticles("fu.va", "critica del design");
  engine.connectParticles("gi.al", "critica del design");
  engine.connectParticles("gi.an", "critica del design");
  engine.connectParticles("gi.em", "critica del design");
  engine.connectParticles("gi.ce", "critica del design");
  engine.connectParticles("gi.mi", "critica del design");
  engine.connectParticles("gi.au", "critica del design");
  engine.connectParticles("gi.gi", "critica del design");
  engine.connectParticles("go.fi", "critica del design");
  engine.connectParticles("gr.fr", "critica del design");
  engine.connectParticles("gu.sa", "critica del design");
  engine.connectParticles("la.lu", "critica del design");
  engine.connectParticles("lo.vi", "critica del design");
  engine.connectParticles("lu.fr", "critica del design");
  engine.connectParticles("lu.ga", "critica del design");
  engine.connectParticles("lu.ma", "critica del design");
  engine.connectParticles("ma.lu", "critica del design");
  engine.connectParticles("ma.cr", "critica del design");
  engine.connectParticles("ma.gi", "critica del design");
  engine.connectParticles("me.ma", "critica del design");
  engine.connectParticles("mo.se", "critica del design");
  engine.connectParticles("mo.an", "critica del design");
  engine.connectParticles("mo.and", "critica del design");
  engine.connectParticles("mo.da", "critica del design");
  engine.connectParticles("mo.ra", "critica del design");
  engine.connectParticles("na.el", "critica del design");
  engine.connectParticles("no.el", "critica del design");
  engine.connectParticles("or.gi", "critica del design");
  engine.connectParticles("pa.lo", "critica del design");
  engine.connectParticles("pa.gi", "critica del design");
  engine.connectParticles("pa.ri", "critica del design");
  engine.connectParticles("pe.an", "critica del design");
  engine.connectParticles("pi.se", "critica del design");
  engine.connectParticles("pi.lo", "critica del design");
  engine.connectParticles("po.be", "critica del design");
  engine.connectParticles("pr.an", "critica del design");
  engine.connectParticles("ra.lu", "critica del design");
  engine.connectParticles("ra.li", "critica del design");
  engine.connectParticles("ri.al", "critica del design");
  engine.connectParticles("ri.ca", "critica del design");
  engine.connectParticles("sa.gl", "critica del design");
  engine.connectParticles("sa.gi", "critica del design");
  engine.connectParticles("sa.fr", "critica del design");
  engine.connectParticles("sa.ma", "critica del design");
  engine.connectParticles("se.gi", "critica del design");
  engine.connectParticles("se.ma", "critica del design");
  engine.connectParticles("si.be", "critica del design");
  engine.connectParticles("sp.fr", "critica del design");
  engine.connectParticles("ta.re", "critica del design");
  engine.connectParticles("tu.da", "critica del design");
  engine.connectParticles("va.gr", "critica del design");
  engine.connectParticles("va.mi", "critica del design");
  engine.connectParticles("ve.ma", "critica del design");
  engine.connectParticles("vi.gl", "critica del design");
  engine.connectParticles("za.sa", "critica del design");
  
  // studenti corso "lab. prodotto 3"     
       
  engine.connectParticles("au.ni", "lab. prodotto 3");
  engine.connectParticles("ba.lu", "lab. prodotto 3");
  engine.connectParticles("ba.va", "lab. prodotto 3");
  engine.connectParticles("ba.ma", "lab. prodotto 3");
  engine.connectParticles("be.ag", "lab. prodotto 3");
  engine.connectParticles("be.mi", "lab. prodotto 3");
  engine.connectParticles("be.jo", "lab. prodotto 3");
  engine.connectParticles("bi.ni", "lab. prodotto 3");
  engine.connectParticles("br.si", "lab. prodotto 3");
  engine.connectParticles("ca.fr", "lab. prodotto 3");
  engine.connectParticles("ca.lu", "lab. prodotto 3");
  engine.connectParticles("di.cl", "lab. prodotto 3");
  engine.connectParticles("do.ag", "lab. prodotto 3");
  engine.connectParticles("dr.el", "lab. prodotto 3");
  engine.connectParticles("fe.lu", "lab. prodotto 3");
  engine.connectParticles("gi.an", "lab. prodotto 3");
  engine.connectParticles("gi.em", "lab. prodotto 3");
  engine.connectParticles("gi.au", "lab. prodotto 3");
  engine.connectParticles("go.fi", "lab. prodotto 3");
  engine.connectParticles("la.lu", "lab. prodotto 3");
  engine.connectParticles("lo.vi", "lab. prodotto 3");
  engine.connectParticles("lu.ga", "lab. prodotto 3");
  engine.connectParticles("mo.and", "lab. prodotto 3");
  engine.connectParticles("mo.da", "lab. prodotto 3");
  engine.connectParticles("or.gi", "lab. prodotto 3");
  engine.connectParticles("pa.lo", "lab. prodotto 3");
  engine.connectParticles("pa.gi", "lab. prodotto 3");
  engine.connectParticles("pe.an", "lab. prodotto 3");
  engine.connectParticles("pi.se", "lab. prodotto 3");
  engine.connectParticles("sa.ma", "lab. prodotto 3");
  engine.connectParticles("se.ma", "lab. prodotto 3");
  engine.connectParticles("tu.da", "lab. prodotto 3");
  engine.connectParticles("va.mi", "lab. prodotto 3");
  engine.connectParticles("ve.ma", "lab. prodotto 3");
  engine.connectParticles("vi.gl", "lab. prodotto 3");
  engine.connectParticles("za.sa", "lab. prodotto 3");
  
  // studenti corso "lab. prodotto 2"
  
  engine.connectParticles("au.ni", "lab. prodotto 2");
  engine.connectParticles("ba.al", "lab. prodotto 2");
  engine.connectParticles("ba.va", "lab. prodotto 2");
  engine.connectParticles("ba.ma", "lab. prodotto 2");
  engine.connectParticles("be.ag", "lab. prodotto 2");
  engine.connectParticles("be.mi", "lab. prodotto 2");
  engine.connectParticles("bi.ni", "lab. prodotto 2");
  engine.connectParticles("br.si", "lab. prodotto 2");
  engine.connectParticles("ca.fr", "lab. prodotto 2");
  engine.connectParticles("ca.lu", "lab. prodotto 2");
  engine.connectParticles("ca.gi", "lab. prodotto 2");
  engine.connectParticles("ci.ma", "lab. prodotto 2");
  engine.connectParticles("de.fe", "lab. prodotto 2");
  engine.connectParticles("di.cl", "lab. prodotto 2");
  engine.connectParticles("do.ag", "lab. prodotto 2");
  engine.connectParticles("dr.el", "lab. prodotto 2");
  engine.connectParticles("fa.ce", "lab. prodotto 2");
  engine.connectParticles("fe.lu", "lab. prodotto 2");
  engine.connectParticles("gi.al", "lab. prodotto 2");
  engine.connectParticles("gi.em", "lab. prodotto 2");
  engine.connectParticles("gi.au", "lab. prodotto 2");
  engine.connectParticles("go.fi", "lab. prodotto 2");
  engine.connectParticles("la.lu", "lab. prodotto 2");
  engine.connectParticles("lo.vi", "lab. prodotto 2");
  engine.connectParticles("lu.ga", "lab. prodotto 2");
  engine.connectParticles("lu.ma", "lab. prodotto 2");
  engine.connectParticles("ma.cr", "lab. prodotto 2");
  engine.connectParticles("ma.lu", "lab. prodotto 2");
  engine.connectParticles("mo.an", "lab. prodotto 2");
  engine.connectParticles("mon.and", "lab. prodotto 2");
  engine.connectParticles("mo.da", "lab. prodotto 2");
  engine.connectParticles("or.gi", "lab. prodotto 2");
  engine.connectParticles("pa.gi", "lab. prodotto 2");
  engine.connectParticles("sa.ma", "lab. prodotto 2");
  engine.connectParticles("se.ma", "lab. prodotto 2");
  engine.connectParticles("ta.re", "lab. prodotto 2");
  engine.connectParticles("tu.da", "lab. prodotto 2");
  engine.connectParticles("va.mi", "lab. prodotto 2");
  engine.connectParticles("ve.ma", "lab. prodotto 2");
  engine.connectParticles("vi.gl", "lab. prodotto 2");
  engine.connectParticles("za.sa", "lab. prodotto 2");
  
  // studenti corso "lab. comunicazione 2"
  
  engine.connectParticles("am.el", "lab. comunicazione 2");
  engine.connectParticles("am.al", "lab. comunicazione 2");
  engine.connectParticles("ba.lu", "lab. comunicazione 2");
  engine.connectParticles("be.jo", "lab. comunicazione 2");
  engine.connectParticles("be.si", "lab. comunicazione 2");
  engine.connectParticles("bl.ce", "lab. comunicazione 2");
  engine.connectParticles("bo.fi", "lab. comunicazione 2");
  engine.connectParticles("ca.iv", "lab. comunicazione 2");
  engine.connectParticles("cl.ra", "lab. comunicazione 2");
  engine.connectParticles("co.cl", "lab. comunicazione 2");
  engine.connectParticles("er.ba", "lab. comunicazione 2");
  engine.connectParticles("fa.ce", "lab. comunicazione 2");
  engine.connectParticles("fa.gi", "lab. comunicazione 2");
  engine.connectParticles("fa.pi", "lab. comunicazione 2");
  engine.connectParticles("fe.mi", "lab. comunicazione 2");
  engine.connectParticles("fe.vi", "lab. comunicazione 2");
  engine.connectParticles("fu.va", "lab. comunicazione 2");
  engine.connectParticles("gi.an", "lab. comunicazione 2");
  engine.connectParticles("gi.ce", "lab. comunicazione 2");
  engine.connectParticles("gi.mi", "lab. comunicazione 2");
  engine.connectParticles("gi.gi", "lab. comunicazione 2");
  engine.connectParticles("gr.fr", "lab. comunicazione 2");
  engine.connectParticles("gu.sa", "lab. comunicazione 2");
  engine.connectParticles("lu.fr", "lab. comunicazione 2");
  engine.connectParticles("ma.gi", "lab. comunicazione 2");
  engine.connectParticles("me.ma", "lab. comunicazione 2");
  engine.connectParticles("mo.se", "lab. comunicazione 2");
  engine.connectParticles("na.el", "lab. comunicazione 2");
  engine.connectParticles("no.el", "lab. comunicazione 2");
  engine.connectParticles("pa.lo", "lab. comunicazione 2");
  engine.connectParticles("pa.ri", "lab. comunicazione 2");
  engine.connectParticles("pe.an", "lab. comunicazione 2");
  engine.connectParticles("pi.se", "lab. comunicazione 2");
  engine.connectParticles("pi.lo", "lab. comunicazione 2");
  engine.connectParticles("pr.an", "lab. comunicazione 2");
  engine.connectParticles("ra.lu", "lab. comunicazione 2");
  engine.connectParticles("ra.li", "lab. comunicazione 2");
  engine.connectParticles("ri.al", "lab. comunicazione 2");
  engine.connectParticles("ri.ca", "lab. comunicazione 2");
  engine.connectParticles("sa.gl", "lab. comunicazione 2");
  engine.connectParticles("sa.fr", "lab. comunicazione 2");
  engine.connectParticles("se.gi", "lab. comunicazione 2");
  engine.connectParticles("si.be", "lab. comunicazione 2");
  engine.connectParticles("sp.fr", "lab. comunicazione 2");
  engine.connectParticles("ti.ma", "lab. comunicazione 2");
  engine.connectParticles("va.gr", "lab. comunicazione 2");
  
  // studenti corso "lab. comunicazione 3"
  
  engine.connectParticles("am.el", "lab. comunicazione 3");
  engine.connectParticles("am.al", "lab. comunicazione 3");
  engine.connectParticles("ba.al", "lab. comunicazione 3");
  engine.connectParticles("bl.ce", "lab. comunicazione 3");
  engine.connectParticles("be.si", "lab. comunicazione 3");
  engine.connectParticles("bo.fi", "lab. comunicazione 3");
  engine.connectParticles("ca.iv", "lab. comunicazione 3");
  engine.connectParticles("ca.gi", "lab. comunicazione 3");
  engine.connectParticles("ci.ma", "lab. comunicazione 3");
  engine.connectParticles("cl.ra", "lab. comunicazione 3");
  engine.connectParticles("co.cl", "lab. comunicazione 3");
  engine.connectParticles("de.fe", "lab. comunicazione 3");
  engine.connectParticles("er.ba", "lab. comunicazione 3");
  engine.connectParticles("fa.ce", "lab. comunicazione 3");
  engine.connectParticles("fa.gi", "lab. comunicazione 3");
  engine.connectParticles("fa.pi", "lab. comunicazione 3");
  engine.connectParticles("fe.mi", "lab. comunicazione 3");
  engine.connectParticles("fe.vi", "lab. comunicazione 3");
  engine.connectParticles("fu.va", "lab. comunicazione 3");
  engine.connectParticles("gi.al", "lab. comunicazione 3");
  engine.connectParticles("gi.ce", "lab. comunicazione 3");
  engine.connectParticles("gi.mi", "lab. comunicazione 3");
  engine.connectParticles("gi.gi", "lab. comunicazione 3");
  engine.connectParticles("gr.fr", "lab. comunicazione 3");
  engine.connectParticles("gu.sa", "lab. comunicazione 3");
  engine.connectParticles("lu.fr", "lab. comunicazione 3");
  engine.connectParticles("lu.ma", "lab. comunicazione 3");
  engine.connectParticles("ma.lu", "lab. comunicazione 3");
  engine.connectParticles("ma.cr", "lab. comunicazione 3");
  engine.connectParticles("ma.gi", "lab. comunicazione 3");
  engine.connectParticles("me.ma", "lab. comunicazione 3");
  engine.connectParticles("mo.se", "lab. comunicazione 3");
  engine.connectParticles("mo.an", "lab. comunicazione 3");
  engine.connectParticles("na.el", "lab. comunicazione 3");
  engine.connectParticles("no.el", "lab. comunicazione 3");
  engine.connectParticles("pa.ri", "lab. comunicazione 3");
  engine.connectParticles("pi.lo", "lab. comunicazione 3");
  engine.connectParticles("pr.an", "lab. comunicazione 3");
  engine.connectParticles("ra.lu", "lab. comunicazione 3");
  engine.connectParticles("ra.li", "lab. comunicazione 3");
  engine.connectParticles("ri.al", "lab. comunicazione 3");
  engine.connectParticles("ri.ca", "lab. comunicazione 3");
  engine.connectParticles("sa.gl", "lab. comunicazione 3");
  engine.connectParticles("sa.fr", "lab. comunicazione 3");
  engine.connectParticles("se.gi", "lab. comunicazione 3");
  engine.connectParticles("si.be", "lab. comunicazione 3");
  engine.connectParticles("sp.fr", "lab. comunicazione 3");
  engine.connectParticles("ta.re", "lab. comunicazione 3");
  engine.connectParticles("ti.ma", "lab. comunicazione 3");
  engine.connectParticles("va.gr", "lab. comunicazione 3");
  
  
  

}

void draw() {
  //update the particles
  engine.update();
  //clear the background
  background (255);
  //draw the particles
  engine.draw();
}

void mousePressed() {
  dragging = engine.particleAt(mouseX, mouseY);
  if (dragging!=null) {
    dragging.dragged = true;
    lastParticle = dragging;
  }
}

void mouseReleased() {
  if (dragging!=null) {
    dragging.dragged=false;
    dragging = null;
  }
}
  
