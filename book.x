<book id="Climate and History"
<title>Climate and History</title>

<bookinfo>
	<authorgroup>
	<author>&person.codynivens;</author>
	</authorgroup>
	<pubdate><?latex \today ?></pubdate>
        <xi:include href="revisions.xml"/>
</bookinfo>

<?latex \setcounter{page}{5} ?>

<part>
	<title>Preface</title>
	<xi:include href="holocene-attributions.xml"/>
	<xi:include href="preface.xml"/>
</part>

<?latex \cleardoublepage ?>

<!-- Contents -->
<toc/>
<?latex \cleardoublepage ?>

<part>
	<title>Introduction</title>
	<xi:include href="introduction.xml"/>
</part>

<part>
	<title>Climatology</title>

	<xi:include href="ocean.xml"/>
	<xi:include href="climate_reconstruction.xml"/>
	<xi:include href="climate_factors.xml"/>
        <xi:include href="global_winter.xml"/>
</part>

<part>
	<title>History by Climate Change</title>
<partintro>
</partintro>

<chapter id="history_by_climate">
<title>History by Climate</title>
        <xi:include href="genesis.xml"/>
        <xi:include href="first_plague.xml"/>
        <xi:include href="crisis_3rd_century.xml"/>
        <xi:include href="arthur.xml"/>
</chapter>


</part>

<!--
 <part>
	<title>Time Line</title>
		
	<xi:include href="timeline.xml"/>
</part>
-->

<part>
	<title>Bond Event 0</title>
	<xi:include href="bond_zero.xml"/>
</part>

<lot/>
<part>
	<title>Appendices</title>

	<xi:include href="appendices.xml"/>

</part>

<bibliography>
	<title>Bibliography</title>

	<xi:include href="bibliobooks.xml"/>
	<xi:include href="biblioweb.xml"/>

</bibliography>



<part>
<title>Glossary</title>
<xi:include href="glossary.xml"/>
</part>

<part>
<title>Index</title>
<index/>
</part>


</book>
