/*@override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text('Selecciona el país a comparar'),
      backgroundColor: Colors.white,
    ),
    body: allCountries.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                // Buscadores
                Row(
                  children: [
                    // Buscador 1
                    Expanded(
                      child: Column(
                        children: [
                          TextField(
                            controller: controller1,
                            decoration: const InputDecoration(
                              hintText: 'Buscar país 1',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          if (controller1.text.isNotEmpty && selectedCountry1 == null)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE3F2FD),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                ],
                              ),
                              constraints: const BoxConstraints(maxHeight: 180),
                              child: ListView(
                                shrinkWrap: true,
                                children: filtered1
                                    .map((c) => ListTile(
                                          leading: Image.network(c.flagUrl, width: 40, height: 30, fit: BoxFit.cover),
                                          title: Text(c.name),
                                          onTap: () {
                                            setState(() {
                                              selectedCountry1 = c;
                                              controller1.text = c.name;
                                            });
                                          },
                                        ))
                                    .toList(),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Buscador 2
                    Expanded(
                      child: Column(
                        children: [
                          TextField(
                            controller: controller2,
                            decoration: const InputDecoration(
                              hintText: 'Buscar país 2',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          if (controller2.text.isNotEmpty && selectedCountry2 == null)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE3F2FD),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                ],
                              ),
                              constraints: const BoxConstraints(maxHeight: 180),
                              child: ListView(
                                shrinkWrap: true,
                                children: filtered2
                                    .map((c) => ListTile(
                                          leading: Image.network(c.flagUrl, width: 40, height: 30, fit: BoxFit.cover),
                                          title: Text(c.name),
                                          onTap: () {
                                            setState(() {
                                              selectedCountry2 = c;
                                              controller2.text = c.name;
                                            });
                                          },
                                        ))
                                    .toList(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Cards de comparación
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: countryCard(selectedCountry1)),
                    Expanded(child: countryCard(selectedCountry2)),
                  ],
                ),
              ],
            ),
          ),
  );
  }
  */