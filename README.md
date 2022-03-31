# era-vocabulary

Vocabulary definition for the European Union Agency for Railways. The vocabulary documentation is built using the [Widoco](https://github.com/dgarijo/Widoco) toolset.

Online documentation for this vocabulary is available at <https://data-interop.era.europa.eu/era-vocabulary/>

## Run WITH Docker

This application has been _dockerized_ to facilitate its deployment. We use a [multi-stage approach](https://docs.docker.com/develop/develop-images/multistage-build/) to build a container that publishes a build of this Web application via a NGINX instance.

To deploy this container follow these steps:

1. Make sure to have a recent version of [Docker](https://docs.docker.com/engine/install/) installed.

2. Build the Docker image:

   ```bash
   docker build -t era-vocabulary ./
   ```

3. Start the application:

   ```bash
   docker run -p ${PORT}:80 era-vocabulary
   ```

   Replace `${PORT}` for the TCP port where you want to run the application. Once the container is running you can access these resources:

   - The vocabulary documentation at `http://localhost:${PORT}/era-vocabulary/index-en.html`.
   - The reference data at `http://localhost:${PORT}/era-vocabulary/era-skos`.

## Deploy WITHOUT Docker

To directly build this application you need to install first:

- [Java JRE](https://openjdk.java.net/projects/jdk/11/) at least v11.
- [Node.js](https://nodejs.org/en/download/) at least v12.

Then follow the next steps:

1. Clone this repository:

   ```bash
   git clone https://github.com/julianrojas87/era-vocabulary.git
   ```

2. Normally the latest built version of the Widoco documentation is already available within the repository in the [`public`](https://github.com/julianrojas87/era-vocabulary/tree/master/public) folder. If you want to deploy this version then skip to step 4, otherwise proceed to delete all the files and folders in `public/`:

   ```bash
   cd public
   rm -rf *
   ```

   Now continue to the next step.

3. Generate the Widoco documentation:

   ```bash
   ./generate-docs.sh
   ```

   The resulting sources will be placed in the `public/doc` folder.

4. Publish the Web page. In this example we use Node.js's [`npx`](https://nodejs.dev/learn/the-npx-nodejs-package-runner) utility and [`http-server`](https://github.com/http-party/http-server) for this, but you may choose to publish the static files otherwise (e.g. directly via NGINX).

   ```bash
   cd public/doc
   npx http-server --cors -p ${PORT}
   ```

   Replace `${PORT}` for the TCP port where you want to run the application. Once the application is running you may access the following resources:

   - The vocabulary documentation at `http://localhost:${PORT}/index-en.html`.
   - The reference data at `http://localhost:${PORT}/era-skos.ttl`.

## See also

1. [Data mappings](https://github.com/julianrojas87/era-data-mappings) for generating the ERA Knowledge Graph, defined using the [RML](https://rml.io) mapping language.
2. [SPARQL query interface](https://linked.ec-dataplatform.eu/sparql) for the ERA Knowledge Graph.
3. [TPF query interface](http://era.ilabt.imec.be/query/) for the ERA Knowledge Graph, based on the [Linked Data Fragments](https://linkeddatafragments.org/) approach and powered by [Comunica](https://comunica.dev/).

## Issues

We welcome issues and enhancement requests that follow these guidelines:

1. Issues opened in this repository should concern the [ERA vocabulary definitions](http://era.ilabt.imec.be/era-vocabulary/index-en.html). For issues related to the ERA Knowledge Graph, please refer to the [data mappings repository](https://github.com/julianrojas87/era-data-mappings/issues).
2. Please label your issues using the corresponding version tag. For example, using the label `v0.9.0`.

## Contributing

For contributions we follow the "fork-and-pull" Git workflow:

1. **Fork** this repository on GitHub.
2. **Clone** the project in your local machine.
3. **Commit** the changes to your own branch.
4. **Push** your changes back up to your own fork.
5. Submit a **Pull request** to the [**dev**](https://github.com/julianrojas87/era-vocabulary/tree/dev) branch so we can review your changes.

NOTE: Make sure to merge the latest "upstream" version before submitting a pull request.
