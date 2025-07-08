module.exports = (srv) => {
  console.log("Service name: ", srv.name);
  console.log("Entities", Object.keys(srv.entities));

  const { Incidents } = srv.entities;

  srv.before("CREATE", Incidents, (req) => {
    console.log(req.data);

    if (req.data) {
      const incidents = Array.isArray(req.data) ? req.data : [req.data];
      incidents.forEach((incident) => {
        if (incident.title?.toLowerCase().includes("urgent")) {
          incident.urgency = { code: "H", descr: "High" };
        }
      });
    }
  });

  srv.before("UPDATE", Incidents, async (req) => {
    const { status_code } = await SELECT.one(
      req.subject,
      (i) => i.status_code
    ).where({ ID: req.data });
    if (status_code === "C")
      return req.reject(`Can't modify a closed incident`);
  });
};
