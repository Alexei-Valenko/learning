<template>
    <div>
        <router-link to="/"  active-class="active">Back to Trainer</router-link>
        <br>
        <strong>List of all trainees :</strong>
        <ul class="list" v-if="trainees.length != 0">
            <li v-for="(trainee, index) in trainees" :key="index"> 
                {{ index+1 }} Name: {{ trainee.name }}; Last Event: {{ trainee.date}} <button v-on:click="connectEvent(index)"> Add Event</button>
            </li> 
        </ul>

        <div v-if="connectingEvent">
            <strong> Add event to trainee:  </strong>
            <br>
            Name : {{currentTrainee.name}} 
            Event : 
            <select name="event" v-model="currentEvent">
            <option value="header" selected disabled > Select event</option>
                <option v-for="(event, index) in events" :key="index" :value="event.id">{{event.date}}</option>
            </select>
            <span v-if="currentEvent!='header'">
                <button  v-on:click="saveEvent"> Save </button>
            </span>             
            <button  v-on:click="connectingEvent = false; currentEvent = 'header' "> Close </button>
        </div>

        <br>

        <strong>Add New Trainee :</strong>
        <br>
        <input type="text" v-model="name">
        <button v-on:click="addTrainee">Add</button>
    </div>
</template>

<script>

export default {
    data() {
        return {
            trainerId: undefined,
            name: '',
            trainees: [],
            connectingEvent: false,
            currentTrainee: undefined,
            events: [], 
            currentEvent: 'header' 
        }
    },
    methods: {
        addTrainee() {
            this.axios.put(`/api/trainees/`, { name: this.name, trainer_id: this.trainerId})
                .then(
                    response => {
                        this.trainees.push({name: this.name, date: 'Never'});
                        this.name = '';
                    },
                     error => console.log(error)
                );
        },

        connectEvent(index) {
            this.trainerId =  localStorage.getItem("trainerId");
            this.axios.get('/api/events?trainer_id=' + this.trainerId) 
                .then(
                    response => {                  
                        this.events = response.data.events; 
                        this.events.forEach( item => {
                            if(item.date !== undefined) {
                                const date = new Date(item.date);
                                item.date = date.getUTCFullYear() + '-' + (date.getUTCMonth() + 1 ) + '-' + date.getUTCDate();
                                item.hour = date.getUTCHours();
                            }
                            else {
                                item.date = '';
                                item.hour = '';                        
                            }
                        });
                        
                        this.connectingEvent = true;
                        this.currentTrainee = this.trainees[index];
                    },
                    error => console.log(error)
                )    
        },

        saveEvent() {    
            console.log(this.currentTrainee.id, this.currentEvent);        
             this.axios.put(`/api/trainees/` + this.currentTrainee.id, { event_id: this.currentEvent, trainer_id:  this.trainerId})
                .then(
                    response => {
                        this.currentEvent =  'header';
                       
                    },
                     error => console.log(error)
                );
        }
    },
    mounted() {
        this.trainerId =  localStorage.getItem("trainerId");
        this.axios.get('/api/trainees?trainer_id=' + this.trainerId) 
            .then(
                response => {                    
                    this.trainees = response.data;
                    this.trainees.map( item => {
                        if(item.last_event != undefined) {
                            const date = new Date(item.last_event.date);
                            item.date = date.getUTCFullYear() + '-' + (date.getUTCMonth() + 1 ) + '-' + date.getUTCDate();
                        }
                        else {
                            item.date = 'Never';
                        }
                        return item;
                    });
                },
                error => console.log(error)
            )
    } ,
}
</script>
