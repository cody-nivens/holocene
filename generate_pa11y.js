#!/usr/bin/env node

const pa11y = require('pa11y');
const fs = require('fs');

runExample();

// Async function required for us to use await
async function runExample() {
	try {

		// Put together some options to use in each test
		const options = require('./generate_pa11y.json');
            options['log'] = {
                debug: console.log,
                error: console.error,
                info: console.log
            }

        identity = (x) => x;
        urls = options['urls']

		// Run tests against multiple URLs
        run = [];
            for (let i = 0; i < urls.length; i++) {
                options1 = Object.assign({}, options);
                options1.actions = options.actions.map(identity);
                options1.actions.push('navigate to ' + urls[i]);
                run.push(pa11y(urls[i], options1));
            }
		const results = await Promise.all(run);

        const report = {"total": results.length,"passes": 0,"errors": 0, "results": {} }
        for (let i = 0; i < results.length; i++) {
            console.log(results[i].pageUrl);
            report.results[results[i].pageUrl] = results[i].issues;
        }

        const stream = fs.createWriteStream("pa11y-ci-results.json");
        stream.once('open', function(fd) {
            stream.write(new Buffer.from(JSON.stringify(report)));
            stream.end();
        });

	} catch (error) {

		// Output an error if it occurred
		console.error(error.message);

	}
}
