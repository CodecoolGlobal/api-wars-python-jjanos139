let planets1 = 'https://swapi.py4e.com/api/planets?page=1'
let planets2 = 'https://swapi.py4e.com/api/planets?page=2'
let planets3 = 'https://swapi.py4e.com/api/planets?page=3'
let planets4 = 'https://swapi.py4e.com/api/planets?page=4'
let planets5 = 'https://swapi.py4e.com/api/planets?page=5'
let planets6 = 'https://swapi.py4e.com/api/planets?page=6'
let planets7 = 'https://swapi.py4e.com/api/planets?page=7'
let pageNumber = 0
let planetsList = [planets1, planets2, planets3, planets4, planets5, planets6, planets7]
document.getElementById('previous-button').classList.add('disabled')

function nextPage() {
    if (pageNumber >= 0 && pageNumber <= 5) {
        pageNumber++
        document.getElementById('planet-body').innerHTML = ''
        initFetch()
        if (pageNumber === 6) {
            document.getElementById('next-button').classList.add('disabled')
        }
        if (pageNumber === 1) {
            document.getElementById('previous-button').classList.remove('disabled')
        }
    }
}

function previousPage() {
    if (pageNumber >= 1 && pageNumber <= 6) {
        pageNumber--
        document.getElementById('planet-body').innerHTML = ''
        initFetch()
        if (pageNumber === 5) {
            document.getElementById('next-button').classList.remove('disabled')
        }
        if (pageNumber === 0) {
            document.getElementById('previous-button').classList.add('disabled')
        }
    }
}

async function fetchPlanetRepository() {
    const response = await fetch(planetsList[pageNumber])
    return await response.json();
}

initFetch()

function initFetch() {
    fetchPlanetRepository().then((responseData) => {
            let peopleResponseData = responseData.results
            let peopleTableHeader = document.getElementById('exampleModalLabel')
            for (let i = 0; i < peopleResponseData.length; i++) {
                let planetsNewTableRow = document.createElement('tr')
                let planetsTableBody = document.getElementById('planet-body')
                planetsTableBody.appendChild(planetsNewTableRow)
                planetsNewTableRow.classList.add('table-light')

                let newPlanetName = document.createElement('td')
                planetsNewTableRow.appendChild(newPlanetName)
                newPlanetName.innerHTML = peopleResponseData[i].name

                let newPlanetDiameter = document.createElement('td')
                if (peopleResponseData[i].diameter === 'unknown' || peopleResponseData[i].diameter === '0') {
                    newPlanetDiameter.innerHTML = 'unknown'
                } else {
                    newPlanetDiameter.innerHTML = peopleResponseData[i].diameter + ' km'
                }

                let newPlanetClimate = document.createElement('td')
                newPlanetClimate.innerHTML = peopleResponseData[i].climate

                let newPlanetTerrain = document.createElement('td')
                newPlanetTerrain.innerHTML = peopleResponseData[i].terrain

                let newPlanetSurfaceWater = document.createElement('td')
                if (peopleResponseData[i].surface_water === 'unknown') {
                    newPlanetSurfaceWater.innerHTML = peopleResponseData[i].surface_water
                } else {
                    newPlanetSurfaceWater.innerHTML = peopleResponseData[i].surface_water + '%'
                }
                let newPlanetPopulation = document.createElement('td')
                if (peopleResponseData[i].population === 'unknown') {
                    newPlanetPopulation.innerHTML = peopleResponseData[i].population
                } else {
                    newPlanetPopulation.innerHTML = parseInt(peopleResponseData[i].population).toLocaleString() + ' people'
                }

                let newPlanetResidents = document.createElement('td')
                let newPlanetResidentsButton = document.createElement('button')
                newPlanetResidentsButton.setAttribute('type', 'button')
                newPlanetResidentsButton.classList.add('btn')
                newPlanetResidentsButton.classList.add('btn-outline-info')
                newPlanetResidentsButton.setAttribute('data-toggle', 'modal')
                newPlanetResidentsButton.setAttribute('data-target', '#exampleModal')
                newPlanetResidentsButton.setAttribute('data-residents', JSON.stringify(peopleResponseData[i].residents))
                newPlanetResidentsButton.addEventListener('click', async function (event) {
                    const residentLinks = JSON.parse(event.target.getAttribute('data-residents'))
                    const tBody = document.querySelector('#people-body')
                    tBody.innerHTML = ''
                    const promises = []
                    for (let residentLink of residentLinks) {
                        //// without Promise.all
                        // const residentData = await (await fetch(residentLink)).json()
                        // tBody.insertAdjacentHTML('beforeend', `
                        // <tr><td>${residentData.name}</td></tr>
                        // `)
                        promises.push(fetch(residentLink))
                    }
                    const responses = await Promise.all(promises)
                    for (let response of responses) {
                        const residentData = await response.json()
                        tBody.insertAdjacentHTML('beforeend', `
                            <tr><td>${residentData.name}</td>
                            <td>${residentData.height}</td>
                            <td>${residentData.mass}</td>
                            <td>${residentData.hair_color}</td>
                            <td>${residentData.skin_color}</td>
                            <td>${residentData.eye_color}</td>
                            <td>${residentData.birth_year}</td>
                            <td>${residentData.gender}</td>
                            </tr>
                            `)
                    }

                })
                if (peopleResponseData[i].residents.length === 1) {
                    newPlanetResidentsButton.innerHTML = peopleResponseData[i].residents.length + ' resident'
                    newPlanetResidents.appendChild(newPlanetResidentsButton)
                }
                if (peopleResponseData[i].residents.length > 1) {
                    newPlanetResidentsButton.innerHTML = peopleResponseData[i].residents.length + ' residents'
                    newPlanetResidents.appendChild(newPlanetResidentsButton)
                }
                if (peopleResponseData[i].residents.length === 0) {
                    newPlanetResidents.innerHTML = 'No known residents'
                }

                let newPlanetVote = document.createElement('td')
                let newPlanetVoteButton = document.createElement('button')
                newPlanetVoteButton.setAttribute('type', 'button')
                newPlanetVoteButton.classList.add('btn')
                newPlanetVoteButton.classList.add('btn-outline-info')
                newPlanetVoteButton.innerHTML = 'Vote'

                peopleTableHeader.innerHTML = 'Residents of ' + // still need to make it unique

                    planetsNewTableRow.appendChild(newPlanetName)
                planetsNewTableRow.appendChild(newPlanetDiameter)
                planetsNewTableRow.appendChild(newPlanetClimate)
                planetsNewTableRow.appendChild(newPlanetTerrain)
                planetsNewTableRow.appendChild(newPlanetSurfaceWater)
                planetsNewTableRow.appendChild(newPlanetPopulation)
                planetsNewTableRow.appendChild(newPlanetResidents)
                newPlanetVote.appendChild(newPlanetVoteButton)
                planetsNewTableRow.appendChild(newPlanetVote)
            }
        }
    )
}