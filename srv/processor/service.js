
module.exports = (srv) => {
  const {
    Incidents
  } = srv.entities

  srv.before("UPDATE", Incidents, async (req) => {
    const { status_code } = await SELECT.one(
      req.subject,
      (i) => i.status_code
    ).where({
      ID: req.data.ID,
    });
    if (status_code === "C")
      return req.reject(`Can't modify a closed incidents`);
  });

  srv.before("CREATE", Incidents, (req) => {
    if (req.data) {
      const incidents = Array.isArray(req.data) ? req.data : [req.data];
      incidents.forEacth((incident) => {
        if (incident.title?.toLowerCase().includes("urgent")) {
          incident.urgency = { code: "H", descr: "Hight" };
        }
      });
    }
  });
};
