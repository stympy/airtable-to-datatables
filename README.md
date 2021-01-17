# Airtable to DataTables

This is a quick example of how to periodically fetch data from [Airtable] and save it in a format that can be used by [DataTables].

This uses the [Serverless Framework] to deploy a function to AWS Lambda that fetches the Airtable data via the API, massages it a bit, and saves it to an S3 bucket. The resulting file can be used with DataTables like so:

```html
<table id="example" class="display" style="width:100%">
    <thead>
      <tr>
        <th>Name</th>
        <th>Vaccines Available?</th>
        <th>Notes</th>
        <th>Latest Report</th>
        <th>Phone Number</th>
        <th>Number of Reports</th>
        <th>County</th>
      </tr>
    </thead>
  </table>
  <script>
    $('#example').dataTable( {
      "ajax": {
        "url": "https://BUCKET_NAME.s3.us-west-2.amazonaws.com/data.json"
      },
      "columns": [
          { "data": "Name" },
          { "data": "Vaccines available?" },
          { "data": "Latest report notes", defaultContent: "" },
          { "data": "Latest report" },
          { "data": "Phone number", defaultContent: "" },
          { "data": "Number of Reports" },
          { "data": "County" }
      ]
    } );
  </script>
```

Configuration of the Airtable URL (available via Help -> API documentation in the Airtable UI) and the Airtable API Key (available via the [Account overview page]) are done via the environment variables AIRTABLE_URL and AIRTABLE_KEY. I like to use [direnv] for that.

[Airtable]: https://www.airtable.com/
[DataTables]: https://www.datatables.net/
[Serverless Framework]: https://www.serverless.com/
[Account overview page]: https://airtable.com/account
[direnv]: https://direnv.net
