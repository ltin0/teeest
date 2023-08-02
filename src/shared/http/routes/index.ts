import { prisma } from '@shared/client'
import { Router } from 'express'
import SalsaService from 'services/SalsaService'

const routes = Router()

routes.get('/', (req, res) => res.json({ success: true }))

routes.get('/listGames', async (req, res) => {
    try {
        const list = await prisma.salsa_games.findMany()

        res.status(201).send({ list })
    } catch (error) {
        res.status(500).send(error)
    }
})

routes.get('/init/:game', async (req, res) => {
    let { game } = req.params

    try {
        const init = await SalsaService.initGame(game, false);

        res.status(201).send(init)
    } catch (error) {
        res.status(500).send(error)
    }
})

routes.get('/salsa/seeders', async (req, res) => {
    try {
        const seedersGame = await SalsaService.seedersGames();

        res.status(201).send({ success: true })
    } catch (error) {
        res.status(500).send(error)
    }
})

routes.post('/api/salsa', (req, res) => {
    console.log(req);
    console.log(res);
    return;
})

export { routes }
