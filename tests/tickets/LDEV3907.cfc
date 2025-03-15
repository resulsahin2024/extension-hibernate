component extends="org.lucee.cfml.test.LuceeTestCase" labels="orm" {
	function beforeAll(){
		variables.uri = createURI("LDEV3907");
	}

	function run( testResults, testBox ) {
		describe("Testcase for LDEV-3907", function() {
			xit( title="Setting the default value in the primary key in ORM entity", skip="#notHasMssql()#", body=function( currentSpec ) {
				try {
					local.result = _InternalRequest(
						template : "#uri#\LDEV3907.cfm"
					).filecontent;
				}
				catch(any e) {
					result = e.stacktrace;
				}
				expect(trim(result)).toBe("LDEV3907");
			});
		});
	}

	private function notHasMssql() {
		return structCount(server.getDatasource("mssql")) == 0;
	}

	private string function createURI(string calledName) {
		var baseURI = "/testAdditional/#listLast(getDirectoryFromPath(getCurrenttemplatepath()),"\/")#/";
		return baseURI&""&calledName;
	}
}