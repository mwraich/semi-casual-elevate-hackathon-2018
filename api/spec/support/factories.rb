module Support
  module Factories

    def sample_program_hash(overrides = {})
      {
        title: "some title",
        date: "Monday, November 20, 2017",
        time: nil,
        enddate: "Monday, December 31, 2018",
        description: "- Free online test web links<br />- A list of sample interview questions<br />- 60 practice questions <br /><br />You will receive a Discover Canada book! <br /><br />Service by appointment only. Please call 647-388-3762 or 647-517-4175 to book an appointment with a settlement worker.<br /><br />In partnership with Immigration, Refugees and Citizenship Canada, Catholic Crosscultural Services & Toronto Public Library.",
        location: nil,
        library: "Agincourt",
        link: "http://www.torontopubliclibrary.ca/detail.jsp?Em=1&Entt=RDMEVT319514&R=EVT319514",
        id: "319514",
        recordtype: "1",
        RCID: "0",
        date1: "2017/11/20",
        date2: "201711200000LSP: Citizenship Test Preparation One-on-One Session",
        enddate1: "2018/12/31",
        length: "0",
        status: nil,
        endtime: nil,
        prieventtype: "01-Library Settlement Partnerships",
        eventtypes: "01-Library Settlement Partnerships, 00-ESL & Newcomer Programs, ",
        eventtype1: "01-Library Settlement Partnerships",
        eventtype2: "00-ESL & Newcomer Programs",
        eventtype3: nil,
        agegroups: "Adult, Older Adult, Teen",
        agegroup1: "Adult",
        agegroup2: "Older Adult",
        agegroup3: "Teen",
        otherinfo: nil,
        linktext: nil,
        linkaddress: nil,
        imagepath: nil,
        imagetext: nil,
        imageheight: nil,
        imagewidth: nil,
        lastupdated: "2018-06-20T15:36:11.000+00:00",
        extratag: nil
      }.merge(overrides)
    end

  end
end